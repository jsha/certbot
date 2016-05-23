#!/bin/bash
# Download and run Boulder instance for integration testing
set -xe

# `/...` avoids `no buildable Go source files` errors, for more info
# see `go help packages`
git clone -b rev-rev https://github.com/letsencrypt/boulder $BOULDERPATH
cd $BOULDERPATH
docker-compose up -d
