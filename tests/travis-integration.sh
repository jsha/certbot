#!/bin/bash

set -o errexit

./tests/boulder-fetch.sh

source .tox/$TOXENV/bin/activate

export CERTBOT_PATH=`pwd`

cd $GOPATH/src/github.com/letsencrypt/boulder/

until curl http://boulder:4000/directory 2>/dev/null; do
  echo waiting for boulder
  sleep 1
done

./tests/boulder-integration.sh
