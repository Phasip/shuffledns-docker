#!/bin/sh -e
wget -q -O /resolvers.txt https://raw.githubusercontent.com/phasip/resolvers/master/resolvers.txt
/root/go/bin/shuffledns -r /resolvers.txt "$@"
