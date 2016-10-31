#!/bin/bash
#
# This script builds tests, deploys them on one of the available test
# servers and runs them.
#

# Test servers configuration
TEST_SERVERS[0]="IP=195.138.84.66;User=pi;Type=solo"
TEST_SERVERS[1]="IP=195.138.84.66;User=pi;Type=dual"

FLASH_CMD=

# Function doesn't accept any arguments. It build the tests,
# packages the binaries into the archive and populates FLASH_CMD variable.
function build {
    echo "Building tests"
    make -C ./tests clean
    make -C ./tests -j8
    FLASH_CMD=$(make -s -C ./tests print_flash_cmd)

    # Now we need to pack all files that are included in the flash cmd
    # so they can be transfered to the remote server and run there
    # Also we need to prepare flash command:
    #  - remove firmware files path
    #  - remove serial port parameter
    mkdir -p /tmp/firmware
    rm -rf /tmp/firmware/*
    params=($FLASH_CMD)
    pushd ./tests
    for param in "${params[@]}"
    do
        if [ -f ${param} ]
        then
            file_name=${param##*/}
            cp ${param} /tmp/firmware/
            FLASH_CMD=${FLASH_CMD/${param}/${file_name}}
        fi

        # Removing port parameter from the cmd string
        if [[ "$param" == "-p" || "$param" == "--port" ]]
        then
            FLASH_CMD=${FLASH_CMD/${param}/}
            next_port=true
        else
            # Removing port value from the cmd string
            if [ "$next_port" ]
            then
                FLASH_CMD=${FLASH_CMD/${param} /}
                unset next_port
            fi
        fi
    done
    cp test_runner.py /tmp/firmware/
    tar -czf /tmp/tests.tar.gz -C /tmp/firmware .
    popd
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
    echo "Running tests, server IP=${1}, type=${3}"
    echo "Flash cmd: ${FLASH_CMD}"
    # Run test runner on the remote server
    # ssh ${2}@${1} "source /home/pi/.profile; cd /tmp/eor_test/; ./test_runner.py --type ${3} -f -c \"${FLASH_CMD}\""
    ssh ${2}@${1} "source /home/pi/.profile; /tmp/eor_test/test_runner.py --type ${3} -f -c \"${FLASH_CMD}\""
}

# First step is to build a firmware
build

failed=0

for server in "${TEST_SERVERS[@]}"
do
    params=(${server//;/ })
    ip=${params[0]#IP=}
    user=${params[1]#User=}
    type=${params[2]#Type=}

    deploy ${ip} ${user}
    if [ "$?" -eq "0" ]
    then
        run_tests ${ip} ${user} ${type}
        if [ "$?" -ne "0" ]
        then
            failed=$((failed+1))
        fi
    else
        echo "Server ${ip} is not available"
    fi
done

exit $failed
