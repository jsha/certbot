#!/bin/bash -x

# >>>> only tested on Ubuntu 14.04LTS <<<<

# install boulder and its go dependencies
git clone -b rev-rev https://github.com/letsencrypt/boulder \
  $GOPATH/src/github.com/letsencrypt/boulder/
cd boulder
docker-compose up -d
