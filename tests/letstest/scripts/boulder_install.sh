#!/bin/bash -x

# >>>> only tested on Ubuntu 14.04LTS <<<<

# install boulder and its go dependencies
git clone -b rev-rev https://github.com/letsencrypt/boulder $BOULDERPATH
cd $BOULDERPATH
sed -i 's/FAKE_DNS: 127.0.0.1/FAKE_DNS: 172.17.42.1/' docker-compose.yml
docker-compose up -d
