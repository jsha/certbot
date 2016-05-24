#!/bin/bash
# Download and run Boulder instance for integration testing
set -xe

# `/...` avoids `no buildable Go source files` errors, for more info
# see `go help packages`
git clone -b rev-rev https://github.com/letsencrypt/boulder $BOULDERPATH
cd $BOULDERPATH
ifconfig
sed -i 's/FAKE_DNS: 127.0.0.1/FAKE_DNS: 172.17.42.1/' docker-compose.yml
docker-compose up -d

