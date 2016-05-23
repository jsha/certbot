#!/bin/bash -x

# >>>> only tested on Ubuntu 14.04LTS <<<<

# install boulder and its go dependencies
go get -d github.com/letsencrypt/boulder/...
cd $GOPATH/src/github.com/letsencrypt/boulder
docker-compose up -d
