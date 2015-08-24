/* Very basic LWIP & FreeRTOS-based DHCP server

   Based on RFC2131 http://www.ietf.org/rfc/rfc2131.txt
   ... although not fully RFC compliant yet.
 */
#include <string.h>

#include <FreeRTOS.h>
#include <task.h>

#include <lwip/netif.h>
#include <lwip/api.h>
#include <lwip/dhcp.h>
#include <lwip/netbuf.h>

#include "dhcpserver.h"

typedef struct {
    uint8_t hwaddr[NETIF_MAX_HWADDR_LEN];
    uint32_t expires;
} dhcp_lease_t;

typedef struct {
    struct netconn *nc;
    dhcp_lease_t leases[DHCPSERVER_MAXCLIENTS];
    struct netif *server_if;
} server_state_t;

/* Handlers for various kinds of incoming DHCP messages */
static void handle_dhcp_discover(server_state_t *state, struct dhcp_msg *received);
static void handle_dhcp_request(server_state_t *state, struct dhcp_msg *dhcpmsg);
static void handle_dhcp_release(server_state_t *state, struct dhcp_msg *dhcpmsg);

static void send_dhcp_nak(server_state_t *state, struct dhcp_msg *dhcpmsg);

/* Utility functions */
static uint8_t *find_dhcp_option(struct dhcp_msg *msg, uint8_t option_num, uint8_t min_length, uint8_t *length);
static uint8_t *add_dhcp_option_byte(uint8_t *opt, uint8_t type, uint8_t value);
static uint8_t *add_dhcp_option_bytes(uint8_t *opt, uint8_t type, void *value, uint8_t len);
static dhcp_lease_t *find_lease_slot(dhcp_lease_t *leases, uint8_t *hwaddr);

static void dhcpserver_task(void *pxParameter)
{
    server_state_t state = {
        /* TODO: allow server interface to be specified as argument to dhcpserver_start() */
        .server_if = netif_list,
    };

    state.nc = netconn_new (NETCONN_UDP);
    if(!state.nc) {
        printf("OTA TFTP: Failed to allocate socket.\r\n");
        return;
    }

    /* Seems in LWIP we need to bind to IP_ADDR_ANY to receive broadcasts.

       No way I can find to either bind only on a particular interface (server_if),
       or to filter incoming broadcasts to only accept those on a single interface,
       when the REQUEST arrives the from address is 0.0.0.0 and to is 255.255.255.255,
       and the pbuf doesn't know about the interface it came in on... :/
     */
    netconn_bind(state.nc, IP_ADDR_ANY, DHCP_SERVER_PORT);

    while(1)
    {
        struct netbuf *netbuf;
        struct dhcp_msg received = { 0 };

        /* Receive a DHCP packet */
        err_t err = netconn_recv(state.nc, &netbuf);
        if(err != ERR_OK) {
            printf("DHCP Server Error: Failed to receive DHCP packet. err=%d\r\n", err);
            continue;
        }

        /* expire any leases that have passed */
        uint32_t now = xTaskGetTickCount();
        for(int i = 0; i < DHCPSERVER_MAXCLIENTS; i++) {
            uint32_t expires = state.leases[i].expires;
            if(expires && expires < now)
                state.leases[i].expires = 0;
        }

        ip_addr_t received_ip;
        u16_t port;
        netconn_addr(state.nc, &received_ip, &port);

        if(netbuf_len(netbuf) < offsetof(struct dhcp_msg, options)) {
            /* too short to be a valid DHCP client message */
            netbuf_delete(netbuf);
            continue;
        }
        if(netbuf_len(netbuf) >= sizeof(struct dhcp_msg)) {
           printf("DHCP Server Warning: Client sent more options than we know how to parse. len=%d\r\n", netbuf_len(netbuf));
        }

        //netconn_connect(nc, netbuf_fromaddr(netbuf), netbuf_fromport(netbuf));
        netbuf_copy(netbuf, &received, sizeof(struct dhcp_msg));
        netbuf_delete(netbuf);

        uint8_t *message_type = find_dhcp_option(&received, DHCP_OPTION_MESSAGE_TYPE,
                                                 DHCP_OPTION_MESSAGE_TYPE_LEN, NULL);
        if(!message_type) {
            printf("DHCP Server Error: No message type field found");
            continue;
        }
        switch(*message_type) {
        case DHCP_DISCOVER:
            handle_dhcp_discover(&state, &received);
            break;
        case DHCP_REQUEST:
            handle_dhcp_request(&state, &received);
            break;
        case DHCP_RELEASE:
            handle_dhcp_release(&state, &received);
        default:
            printf("DHCP Server Error: Unsupported message type %d\r\n", *message_type);
            break;
        }
    }
}

static void handle_dhcp_discover(server_state_t *state, struct dhcp_msg *dhcpmsg)
{
    if(dhcpmsg->htype != DHCP_HTYPE_ETH)
        return;
    if(dhcpmsg->hlen > NETIF_MAX_HWADDR_LEN)
        return;

    dhcp_lease_t *freelease = find_lease_slot(state->leases, dhcpmsg->chaddr);
    if(!freelease) {
        printf("DHCP Server: All leases taken.\r\n");
        return; /* Nothing available, so do nothing */
    }

    /* Reuse the DISCOVER buffer for the OFFER response */
    dhcpmsg->op = DHCP_BOOTREPLY;
    bzero(dhcpmsg->options, DHCP_OPTIONS_LEN);

    DHCPSERVER_FIRST_CLIENT_IP(&(dhcpmsg->yiaddr));
    ip4_addr4(&(dhcpmsg->yiaddr)) += (freelease - state->leases);

    uint8_t *opt = (uint8_t *)&dhcpmsg->options;
    opt = add_dhcp_option_byte(opt, DHCP_OPTION_MESSAGE_TYPE, DHCP_OFFER);

    opt = add_dhcp_option_bytes(opt, DHCP_OPTION_SERVER_ID, &state->server_if->ip_addr, 4);
    opt = add_dhcp_option_bytes(opt, DHCP_OPTION_SUBNET_MASK, &state->server_if->netmask, 4);
    opt = add_dhcp_option_bytes(opt, DHCP_OPTION_END, NULL, 0);

    printf("Sending discover response...\r\n");
    struct netbuf *netbuf = netbuf_new();
    netbuf_alloc(netbuf, sizeof(struct dhcp_msg));
    netbuf_take(netbuf, dhcpmsg, sizeof(struct dhcp_msg));
    netconn_sendto(state->nc, netbuf, IP_ADDR_BROADCAST, 68);
    netbuf_delete(netbuf);
}

static void handle_dhcp_request(server_state_t *state, struct dhcp_msg *dhcpmsg)
{
    if(dhcpmsg->htype != DHCP_HTYPE_ETH)
        return;
    if(dhcpmsg->hlen > NETIF_MAX_HWADDR_LEN)
        return;

    ip_addr_t requested_ip;
    uint8_t *requested_ip_opt = find_dhcp_option(dhcpmsg, DHCP_OPTION_REQUESTED_IP, 4, NULL);
    if(requested_ip_opt) {
            memcpy(&requested_ip.addr, requested_ip_opt, 4);
    } else if(ip_addr_cmp(&requested_ip, IP_ADDR_ANY)) {
        ip_addr_copy(requested_ip, dhcpmsg->ciaddr);
    } else {
        printf("DHCP Server Error: No requested IP\r\n");
        send_dhcp_nak(state, dhcpmsg);
        return;
    }
    ip_addr_t first_client_ip;
    DHCPSERVER_FIRST_CLIENT_IP(&first_client_ip);

    /* Test the first 4 octets match */
    if(ip4_addr1(&requested_ip) != ip4_addr1(&first_client_ip)
       || ip4_addr2(&requested_ip) != ip4_addr2(&first_client_ip)
       || ip4_addr3(&requested_ip) != ip4_addr3(&first_client_ip)) {
        printf("DHCP Server Error: 0x%08lx Not an allowed IP\r\n", requested_ip.addr);
        send_dhcp_nak(state, dhcpmsg);
        return;
    }
    /* Test the last octet is in the MAXCLIENTS range */
    int16_t octet_offs = ip4_addr4(&requested_ip) - ip4_addr4(&first_client_ip);
    if(octet_offs < 0 || octet_offs >= DHCPSERVER_MAXCLIENTS) {
        printf("DHCP Server Error: Address out of range\r\n");
        send_dhcp_nak(state, dhcpmsg);
        return;
    }

    dhcp_lease_t *requested_lease = state->leases + octet_offs;
    if(requested_lease->expires != 0 && memcmp(requested_lease->hwaddr, dhcpmsg->chaddr,dhcpmsg->hlen))
    {
        printf("DHCP Server Error: Lease for address already taken\r\n");
        send_dhcp_nak(state, dhcpmsg);
        return;
    }

    memcpy(requested_lease->hwaddr, dhcpmsg->chaddr, dhcpmsg->hlen);
    printf("DHCP lease addr 0x%08lx assigned to MAC %02x:%02x:%02x:%02x:%02x:%02x\r\n", requested_ip.addr, requested_lease->hwaddr[0],
           requested_lease->hwaddr[1], requested_lease->hwaddr[2], requested_lease->hwaddr[3], requested_lease->hwaddr[4],
           requested_lease->hwaddr[5]);
    requested_lease->expires = DHCPSERVER_LEASE_TIME * configTICK_RATE_HZ;

    /* Reuse the REQUEST message as the ACK message */
    dhcpmsg->op = DHCP_BOOTREPLY;
    bzero(dhcpmsg->options, DHCP_OPTIONS_LEN);

    ip_addr_copy(dhcpmsg->yiaddr, requested_ip);

    uint8_t *opt = (uint8_t *)&dhcpmsg->options;
    opt = add_dhcp_option_byte(opt, DHCP_OPTION_MESSAGE_TYPE, DHCP_ACK);
    uint32_t expiry = htonl(DHCPSERVER_LEASE_TIME);
    opt = add_dhcp_option_bytes(opt, DHCP_OPTION_LEASE_TIME, &expiry, 4);
    opt = add_dhcp_option_bytes(opt, DHCP_OPTION_SERVER_ID, &state->server_if->ip_addr, 4);
    opt = add_dhcp_option_bytes(opt, DHCP_OPTION_END, NULL, 0);

    struct netbuf *netbuf = netbuf_new();
    netbuf_alloc(netbuf, sizeof(struct dhcp_msg));
    netbuf_take(netbuf, dhcpmsg, sizeof(struct dhcp_msg));
    netconn_sendto(state->nc, netbuf, IP_ADDR_BROADCAST, 68);
    netbuf_delete(netbuf);
}

static void handle_dhcp_release(server_state_t *state, struct dhcp_msg *dhcpmsg)
{
    dhcp_lease_t *lease = find_lease_slot(state->leases, dhcpmsg->chaddr);
    if(lease) {
        lease->expires = 0;
    }
}

static void send_dhcp_nak(server_state_t *state, struct dhcp_msg *dhcpmsg)
{
    /* Reuse 'dhcpmsg' for the NAK */
    dhcpmsg->op = DHCP_BOOTREPLY;
    bzero(dhcpmsg->options, DHCP_OPTIONS_LEN);

    uint8_t *opt = (uint8_t *)&dhcpmsg->options;
    opt = add_dhcp_option_byte(opt, DHCP_OPTION_MESSAGE_TYPE, DHCP_NAK);
    opt = add_dhcp_option_bytes(opt, DHCP_OPTION_SERVER_ID, &state->server_if->ip_addr, 4);
    opt = add_dhcp_option_bytes(opt, DHCP_OPTION_END, NULL, 0);

    struct netbuf *netbuf = netbuf_new();
    netbuf_alloc(netbuf, sizeof(struct dhcp_msg));
    netbuf_take(netbuf, dhcpmsg, sizeof(struct dhcp_msg));
    netconn_sendto(state->nc, netbuf, IP_ADDR_BROADCAST, 68);
    netbuf_delete(netbuf);
}

static uint8_t *find_dhcp_option(struct dhcp_msg *msg, uint8_t option_num, uint8_t min_length, uint8_t *length)
{
    uint8_t *start = (uint8_t *)&msg->options;
    uint8_t *msg_end = (uint8_t *)msg + sizeof(struct dhcp_msg);

    for(uint8_t *p = start; p < msg_end-2;) {
        uint8_t type = *p++;
        uint8_t len = *p++;
        if(type == DHCP_OPTION_END)
            return NULL;
        if(p+len >= msg_end)
            break; /* We've overrun our valid DHCP message size, or this isn't a valid option */
        if(type == option_num) {
            if(len < min_length)
                break;
            if(length)
                *length = len;
            return p; /* start of actual option data */
        }
        p += len;
    }
    return NULL; /* Not found */
}

static uint8_t *add_dhcp_option_byte(uint8_t *opt, uint8_t type, uint8_t value)
{
    *opt++ = type;
    *opt++ = 1;
    *opt++ = value;
    return opt;
}

static uint8_t *add_dhcp_option_bytes(uint8_t *opt, uint8_t type, void *value, uint8_t len)
{
    *opt++ = type;
    if(len) {
        *opt++ = len;
        memcpy(opt, value, len);
    }
    return opt+len;
}

/* Find a free DHCP lease, or a lease already assigned to 'hwaddr' */
static dhcp_lease_t *find_lease_slot(dhcp_lease_t *leases, uint8_t *hwaddr)
{
    dhcp_lease_t *empty_lease = NULL;
    for(int i = 0; i < DHCPSERVER_MAXCLIENTS; i++) {
        if(leases->expires == 0 && !empty_lease)
            empty_lease = &leases[i];
        else if (memcmp(hwaddr, leases[i].hwaddr, 6) == 0)
            return &leases[i];

    }
    return empty_lease;
}

static xTaskHandle dhcpserver_task_handle;

void dhcpserver_start(void)
{
    xTaskCreate(dhcpserver_task, (signed char *)"DHCPServer", 768, NULL, 8, &dhcpserver_task_handle);
}

void dhcpserver_stop(void)
{
    if(dhcpserver_task_handle) {
        vTaskDelete(dhcpserver_task_handle);
        dhcpserver_task_handle = NULL;
    }
}
