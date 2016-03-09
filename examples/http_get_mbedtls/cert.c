/* This is the root certificate for the CA trust chain of
   www.howsmyssl.com in PEM format, as dumped via:

   openssl s_client -showcerts -connect www.howsmyssl.com:443 </dev/null

   The root cert is the last cert in the chain output by the server.
*/
#include <stdio.h>
#include <stdint.h>
#include <string.h>

const char *server_root_cert = "-----BEGIN CERTIFICATE-----\r\n"
"MIIFNzCCBB+gAwIBAgISAfl7TPw6Mf/F6VCBc5eaHA7kMA0GCSqGSIb3DQEBCwUA\r\n"
"MEoxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1MZXQncyBFbmNyeXB0MSMwIQYDVQQD\r\n"
"ExpMZXQncyBFbmNyeXB0IEF1dGhvcml0eSBYMTAeFw0xNTEyMzAwNzQ0MDBaFw0x\r\n"
"NjAzMjkwNzQ0MDBaMBwxGjAYBgNVBAMTEXd3dy5ob3dzbXlzc2wuY29tMIIBIjAN\r\n"
"BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArKF7WzSrDPinQhd9mVfoW5u46/TC\r\n"
"fbYKR3MEryetUSeQuwuXFj2xO6+a/JQ99UC3Eq+9s8uFdx1zFFS6qfW+HXBwGWVf\r\n"
"ajKEyIcXUJZCRn7aWpTWZq6cuv4bZSv1QklGViQs8UCZifcN0A/mYrH7zHG2WDn2\r\n"
"fxNgA+nJBqbZPr1gP9hqGFCnX+dPR5WxtC9+Dv9Sx+wiOWVz/obVTCygdqqcpa5I\r\n"
"3/U9REVgO2VfT+xMty6NZTMCjTJ+GXZuB/BrMe9+ZmgWk0grJyqdrCxOCyK6B4g+\r\n"
"Fvs8WFRNTHdQnP3/NT5hPtreZ3nuY2YY7RbGFwUaBcvJwbbIqalpiQ1X7QIDAQAB\r\n"
"o4ICQzCCAj8wDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggr\r\n"
"BgEFBQcDAjAMBgNVHRMBAf8EAjAAMB0GA1UdDgQWBBQMAe087CSp3PjgqyIYyWTR\r\n"
"a2aMnTAfBgNVHSMEGDAWgBSoSmpjBH3duubRObemRWXv86jsoTBwBggrBgEFBQcB\r\n"
"AQRkMGIwLwYIKwYBBQUHMAGGI2h0dHA6Ly9vY3NwLmludC14MS5sZXRzZW5jcnlw\r\n"
"dC5vcmcvMC8GCCsGAQUFBzAChiNodHRwOi8vY2VydC5pbnQteDEubGV0c2VuY3J5\r\n"
"cHQub3JnLzBNBgNVHREERjBEgg1ob3dzbXlzc2wuY29tgg1ob3dzbXl0bHMuY29t\r\n"
"ghF3d3cuaG93c215dGxzLmNvbYIRd3d3Lmhvd3NteXNzbC5jb20wgf4GA1UdIASB\r\n"
"9jCB8zAIBgZngQwBAgEwgeYGCysGAQQBgt8TAQEBMIHWMCYGCCsGAQUFBwIBFhpo\r\n"
"dHRwOi8vY3BzLmxldHNlbmNyeXB0Lm9yZzCBqwYIKwYBBQUHAgIwgZ4MgZtUaGlz\r\n"
"IENlcnRpZmljYXRlIG1heSBvbmx5IGJlIHJlbGllZCB1cG9uIGJ5IFJlbHlpbmcg\r\n"
"UGFydGllcyBhbmQgb25seSBpbiBhY2NvcmRhbmNlIHdpdGggdGhlIENlcnRpZmlj\r\n"
"YXRlIFBvbGljeSBmb3VuZCBhdCBodHRwczovL2xldHNlbmNyeXB0Lm9yZy9yZXBv\r\n"
"c2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEALB2QrIrcxxFr81b6khy9LwVBpthL\r\n"
"2LSs0xWhA09gxHmPnVrqim3Wa9HFYRApSqtTQWSx58TO+MERXQ7eDX50k53oem+Q\r\n"
"gXn90HVDkR0jbV1CsAD5qL00kKOofAyGkUhFlO2hcRU0CIj7Z9HZB8xpYdZWLUSZ\r\n"
"BpgiXdf/YYRIwgx29GRQjhfl/H30fHyawY5SvquJuvAeEr7lxqAmEEg3a7J6ibHL\r\n"
"90zf5KMkXGyVsXqxLqrEXQKgTvpUMeP5iYAxE45R5GNmYS2jajyTi4XkWw4nEu4Q\r\n"
"dMTLuwxGz87KOwSSFOLU903hO3IIPvFIIMY6aVK2kAgQPNIqk9nFurTF9A==\r\n"
"-----END CERTIFICATE-----\r\n";


