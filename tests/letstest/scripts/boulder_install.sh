#!/bin/bash -x

# >>>> only tested on Ubuntu 14.04LTS <<<<

# install boulder and its go dependencies
git clone -b rev-rev https://github.com/letsencrypt/boulder $BOULDERPATH
cd $BOULDERPATH
docker-compose up -d
