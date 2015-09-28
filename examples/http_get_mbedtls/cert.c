/* This is the root certificate for the CA trust chain of
   www.howsmyssl.com in PEM format, as dumped via:

   openssl s_client -showcerts -connect www.howsmyssl.com:443 </dev/null

   The root cert is the last cert in the chain output by the server.
*/
#include <stdio.h>
#include <stdint.h>
#include <string.h>

const char *server_root_cert = "-----BEGIN CERTIFICATE-----\r\n"
"MIIEWTCCA0GgAwIBAgIDAjpjMA0GCSqGSIb3DQEBBQUAMEIxCzAJBgNVBAYTAlVT\r\n"
"MRYwFAYDVQQKEw1HZW9UcnVzdCBJbmMuMRswGQYDVQQDExJHZW9UcnVzdCBHbG9i\r\n"
"YWwgQ0EwHhcNMTIwODI3MjA0MDQwWhcNMjIwNTIwMjA0MDQwWjBEMQswCQYDVQQG\r\n"
"EwJVUzEWMBQGA1UEChMNR2VvVHJ1c3QgSW5jLjEdMBsGA1UEAxMUR2VvVHJ1c3Qg\r\n"
"U1NMIENBIC0gRzIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC5J/lP\r\n"
"2Pa3FT+Pzc7WjRxr/X/aVCFOA9jK0HJSFbjJgltYeYT/JHJv8ml/vJbZmnrDPqnP\r\n"
"UCITDoYZ2+hJ74vm1kfy/XNFCK6PrF62+J589xD/kkNm7xzU7qFGiBGJSXl6Jc5L\r\n"
"avDXHHYaKTzJ5P0ehdzgMWUFRxasCgdLLnBeawanazpsrwUSxLIRJdY+lynwg2xX\r\n"
"HNil78zs/dYS8T/bQLSuDxjTxa9Akl0HXk7+Yhc3iemLdCai7bgK52wVWzWQct3Y\r\n"
"TSHUQCNcj+6AMRaraFX0DjtU6QRN8MxOgV7pb1JpTr6mFm1C9VH/4AtWPJhPc48O\r\n"
"bxoj8cnI2d+87FLXAgMBAAGjggFUMIIBUDAfBgNVHSMEGDAWgBTAephojYn7qwVk\r\n"
"DBF9qn1luMrMTjAdBgNVHQ4EFgQUEUrQcznVW2kIXLo9v2SaqIscVbwwEgYDVR0T\r\n"
"AQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAQYwOgYDVR0fBDMwMTAvoC2gK4Yp\r\n"
"aHR0cDovL2NybC5nZW90cnVzdC5jb20vY3Jscy9ndGdsb2JhbC5jcmwwNAYIKwYB\r\n"
"BQUHAQEEKDAmMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5nZW90cnVzdC5jb20w\r\n"
"TAYDVR0gBEUwQzBBBgpghkgBhvhFAQc2MDMwMQYIKwYBBQUHAgEWJWh0dHA6Ly93\r\n"
"d3cuZ2VvdHJ1c3QuY29tL3Jlc291cmNlcy9jcHMwKgYDVR0RBCMwIaQfMB0xGzAZ\r\n"
"BgNVBAMTElZlcmlTaWduTVBLSS0yLTI1NDANBgkqhkiG9w0BAQUFAAOCAQEAPOU9\r\n"
"WhuiNyrjRs82lhg8e/GExVeGd0CdNfAS8HgY+yKk3phLeIHmTYbjkQ9C47ncoNb/\r\n"
"qfixeZeZ0cNsQqWSlOBdDDMYJckrlVPg5akMfUf+f1ExRF73Kh41opQy98nuwLbG\r\n"
"mqzemSFqI6A4ZO6jxIhzMjtQzr+t03UepvTp+UJrYLLdRf1dVwjOLVDmEjIWE4ry\r\n"
"lKKbR6iGf9mY5ffldnRk2JG8hBYo2CVEMH6C2Kyx5MDkFWzbtiQnAioBEoW6MYhY\r\n"
"R3TjuNJkpsMyWS4pS0XxW4lJLoKaxhgVRNAuZAEVaDj59vlmAwxVG52/AECu8Egn\r\n"
"TOCAXi25KhV6vGb4NQ==\r\n"
"-----END CERTIFICATE-----\r\n";


