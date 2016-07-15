# POSIX file access example

This example runs several file system tests on ESP8266.
It uses fs-test library to perform file operations test. fs-test library uses
only POSIX file functions so can be run on host system as well.

Currently included tests:
 * File system load test. Perform multiple file operations in random order.
 * File system speed test. Measures files read/write speed.

