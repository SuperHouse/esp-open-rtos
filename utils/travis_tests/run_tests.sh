#!/bin/bash

TEST_SERVERS[0]="IP=195.138.84.66;User=pi;Type=dual"
# TEST_SERVERS[1]="IP=195.138.84.55;Type=solo"

function build {
    echo "Building tests"
    make -C ./tests clean
    make -C ./tests -j8
    tar -czf /tmp/tests.tar.gz ./tests ./common.mk ./parameters.mk
}

# $1 - Server IP
# $2 - Login user name
function deploy {
    echo "Deploying tests, server IP=${1}"
    scp /tmp/tests.tar.gz ${2}@${1}:/tmp/tests.tar.gz
    ssh ${2}@${1} mkdir -p /tmp/eor_test
    ssh ${2}@${1} rm -rf /tmp/eor_test/*
    ssh ${2}@${1} tar -xzf /tmp/tests.tar.gz -C /tmp/eor_test
}

# $1 - Server IP
# $2 - Login user name
# $3 - Type "solo" or "dual"
function run_tests {
    echo "Running tests, server IP=${1}, type=${2}"
}

build

for server in "${TEST_SERVERS[@]}"
do
    params=(${server//;/ })
    ip=${params[0]#IP=}
    user=${params[1]#User=}
    type=${params[2]#Type=}
    
    deploy ${ip} ${user}
    run_tests ${ip} ${user} ${type}
done

