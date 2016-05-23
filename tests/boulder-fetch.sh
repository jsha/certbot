#!/bin/bash
# Download and run Boulder instance for integration testing

# ugh, go version output is like:
# go version go1.4.2 linux/amd64
GOVER=`go version | cut -d" " -f3 | cut -do -f2`

# version comparison
function verlte {
  #OS X doesn't support version sorting; emulate with sed
  if [ `uname` == 'Darwin' ]; then
    [ "$1" = "`echo -e \"$1\n$2\" |  sed 's/\b\([0-9]\)\b/0\1/g' \
      | sort | sed 's/\b0\([0-9]\)/\1/g' | head -n1`" ]
  else
    [  "$1" = "`echo -e "$1\n$2" | sort -V | head -n1`" ]
  fi
}

if ! verlte 1.5 "$GOVER" ; then
  echo "We require go version 1.5 or later; you have... $GOVER"
  exit 1
fi

set -xe

# `/...` avoids `no buildable Go source files` errors, for more info
# see `go help packages`
git clone -b rev-rev https://github.com/letsencrypt/boulder
cd boulder
docker-compose up -d
