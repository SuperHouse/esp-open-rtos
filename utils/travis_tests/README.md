Travis CI Tests
====================

This directory contains a script `run_tests.sh` that is executed by Travis CI.
The script builds a test firmware, deploys it on one of the test servers and
runs it.

The script will not return an error if deployment to one of the test servers has
failed. It is done this way not to fail a build if a test server is down.
The script will return an error if deployment was successful but tests failed.

Test servers
------------

Test server is a linux host that is accessible from the Internet by a static IP.
It should have at least one ESP8266 module connected to a USB port. The module
should be capable restarting and switching to boot mode via a serial port.
All popular **NodeMCU** and **Wemos** modules will work.

To run tests on a server it should provide SSH access. SSH daemon should be
configured to authenticate using keys.

Test server running on Raspberry PI:

![Raspberry PI Test server][example-test-server]

### Test server requirements

* Linux host
* Public static IP
* One or two ESP8266 modules connected to USB ports
* SSH access from the Internet (with public key from Travis CI)
* Python3
* [esptool.py] installed
* pySerial python module `pip install pyserial`

### Create SSH keys for Travis

[Here][travis-ssh-deploy] is a good article about Travis deployment using SSH.

The problem with SSH access from Travis to a server is that it should have
a private key. But this key should not be publicly available.

Hopefully Travis allows to encrypt certain files and only decrypt them at build
stage. So the sensitive file is stored in the repository encrypted.

Generate a new key pair:
```bash
ssh-keygen -t rsa -b 4096 -C '<repo>@travis-ci.org' -f ./<server_name>_rsa
```

To encrypt a private key you need a command line Travis client.

To install it run:
```bash
gem install travis
```
Or refer [the official installation instructions][travis-install].

The following command will encrypt a file and modify .travis.yml:
```bash
travis encrypt-file <server_name>_rsa --add
```

Deploy public key to a test server:
```bash
ssh-copy-id -i <server_name>_rsa.pub <ssh-user>@<deploy-host>
```

Add the following lines in the .travis.yml:
```yml
addons:
  ssh_known_hosts: <server_ip>
```
```yml
before_install:
- openssl aes-256-cbc aes-256-cbc -K $encrypted_<...>_key -iv $encrypted_<...>_iv -in <server_name>_rsa.enc -out /tmp/<server_name>_rsa -d
- eval "$(ssh-agent -s)"
- chmod 600 /tmp/<server_name>_rsa
- ssh-add /tmp/<server_name>_rsa
```

Remove keys and stage files for commit:
```bash
rm -f <server_name>_rsa <server_name>_rsa.pub
git add <server_name>_rsa.enc .travis.yml
```

### Add test server

The final step is to add a server to the test runner script.
Add a new item into an array in `run_tests.sh`:
```bash
TEST_SERVERS[2]="IP=<server_ip>;User=<ssh_user_name>;Type=<solo|dual>"
```


[esptool.py]: https://github.com/espressif/esptool
[travis-ssh-deploy]: https://oncletom.io/2016/travis-ssh-deploy
[travis-install]: https://github.com/travis-ci/travis.rb#installation
[example-test-server]: ./test_server_example.png
