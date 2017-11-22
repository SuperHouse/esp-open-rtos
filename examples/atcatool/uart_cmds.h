
#include <cryptoauthlib.h>

#define MAX_ARGC (10)
#define LOG(...) printf(__VA_ARGS__); printf("\r\n");
#define LOG_SUCCESSFAIL(name, oper) if((oper) == ATCA_SUCCESS) { LOG("%s succeeded!\n", name); } else { LOG("%s failed!", name); }

#define BEGIN_PUB_KEY_CONST "-----BEGIN PUBLIC KEY-----"
#define END_PUB_KEY_CONST "-----END PUBLIC KEY-----"

#define BEGIN_PRIV_KEY_CONST "-----BEGIN EC PRIVATE KEY-----"
#define END_PRIV_KEY_CONST "-----END EC PRIVATE KEY-----"

ATCA_STATUS cmd_pub(uint32_t argc, char *argv[]);
ATCA_STATUS cmd_priv(uint32_t argc, char *argv[]);
ATCA_STATUS cmd_verify(uint32_t argc, char *argv[]);
ATCA_STATUS cmd_ecdh(uint32_t argc, char *argv[]);

// Utility
ATCA_STATUS read_pubkey_stdin(uint8_t *keyOut, int *len);
ATCA_STATUS read_privkey_stdin(uint8_t *keyOut, int *len);
bool prompt_user();
bool parse_asn1_signature(uint8_t *asn1Sig, size_t asn1SigLen, uint8_t signatureRintSintOUT[ATCA_SIG_SIZE]);
void print_b64_pubkey(uint8_t pubkey[ATCA_PUB_KEY_SIZE]);
