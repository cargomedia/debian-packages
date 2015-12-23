#!/bin/sh

VERSION='4.5.0.3'
wget "http://http.debian.net/debian/pool/main/c/coturn/coturn_${VERSION}.orig.tar.gz"
unp coturn_${VERSION}.orig.tar.gz
cd turnserver-${VERSION}/
