/* Very basic LWIP & FreeRTOS-based DHCP server

 */
#ifndef _DHCPSERVER_H
#define _DHCPSERVER_H

#ifndef DHCPSERVER_MAXCLIENTS
#define DHCPSERVER_MAXCLIENTS 4
#endif

/* First client IP to hand out.

   IP assignment routine is very simple - Fourth octet in IP will be incremented
   from this value to (value+DHCPSERVER_MAXCLIENTS-1).
*/
#ifndef DHCPSERVER_FIRST_CLIENT_IP
#define DHCPSERVER_FIRST_CLIENT_IP(DST) IP4_ADDR(DST, 192, 168, 3, 5)
#endif

#ifndef DHCPSERVER_LEASE_TIME
#define DHCPSERVER_LEASE_TIME 30
#endif

/* Start DHCP server.

   Static IP of server should already be set and network interface enabled.
*/
void dhcpserver_start(void);

/* Stop DHCP server.
 */
void dhcpserver_stop(void);

#endif
