#!/bin/bash
# Download and run Boulder instance for integration testing

if ! go version | grep go1.5 ; then
  echo "We require go version 1.5 or later; you have... $(go version)"
  exit 1
fi

set -xe

# `/...` avoids `no buildable Go source files` errors, for more info
# see `go help packages`
go get -d github.com/letsencrypt/boulder/...
cd $GOPATH/src/github.com/letsencrypt/boulder
./test/setup.sh
cd -
