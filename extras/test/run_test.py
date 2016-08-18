#!/usr/bin/env python
# -*- coding: utf-8 -*-

# This script reads specified serial port for test output. If the test is
# successfully finished the script returns 0 otherwise -1. The script also
# checks for time-out. The timeout value is received from the test itself
# during test initialization.
#
# The script runs as many instances as many serial devices provided.
#
# Usage:
# > run_test.py /dev/ttyUSB0
# or
# > run_test.py /dev/ttyUSB0 /dev/ttyUSB1 /dev/ttyUSB2
# if three devices are connected and should be tested simultaneously
#


import serial
import re
import sys
import time
import threading


class Test(threading.Thread):
    def __init__(self, port, baudrate):
        threading.Thread.__init__(self)
        print("init: {}".format(port))
        self._port = serial.Serial(port, baudrate, timeout=1)
        self._timeout = None
        self.result = None

    def wait_start(self):
        skip_lines = 100
        while skip_lines > 0:
            l = self._port.readline()
            if 'TEST_INIT: TIMEOUT=' in l:
                res = re.findall(r'\d+', l)
                if len(res) != 1:
                    print("Invalid timeout format")
                    self.result = False
                    return
                else:
                    self._timeout = int(res[0])
                break
            else:
                sys.stdout.write(l)
                skip_lines -= 1
        if self._timeout is None:
            print("Device is not responding")
            self.result = False
        else:
            print("Timeout: {}".format(self._timeout))
            self.result = True

    def test(self):
        end_time = time.time() + self._timeout
        result = None
        while end_time > time.time():
            l = self._port.readline()
            if 'TEST_FINISH: ' in l:
                if 'SUCCESS' in l:
                    print("Test finished successfully")
                    result = True
                    break
                elif 'FAIL' in l:
                    print("Test failed")
                    result = False
                else:
                    print("Unknown status")
                    result = False
            else:
                if l is not None:
                    sys.stdout.write(l)
        if result is None:
            print("Test timeout")
        return result

    def run(self):
        self.wait_start()
        if self.result is not None:
            self.result = self.test()

    def __del__(self):
        self._port.close()


def main():
    if len(sys.argv) <= 1:
        print("Need at least one serial device to test a device")
        exit(-1)

    tasks = []
    for dev in sys.argv[1:]:
        t = Test(dev, 115200)
        t.start()
        tasks.append(t)

    result = True
    for t in tasks:
        t.join()
        result = result and t.result

    if result:
        print("Test: SUCCESS")
    else:
        print("Test: FAIL")

if __name__ == "__main__":
    main()
