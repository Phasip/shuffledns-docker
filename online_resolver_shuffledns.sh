#!/bin/sh -e
wget -q -O /resolvers.txt https://raw.githubusercontent.com/phasip/resolvers/master/resolvers-stable-grade11.txt
sort -rU -o /resolvers.txt /resolvers.txt
/root/go/bin/shuffledns -r /resolvers.txt "$@"
