#!/bin/sh -e
wget -q -O /resolvers.txt https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt
/root/go/bin/shuffledns -r /resolvers.txt "$@"
