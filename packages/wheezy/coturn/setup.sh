#!/bin/sh

VERSION='4.5.0.3-1'
wget "http://http.debian.net/debian/pool/main/c/coturn/coturn_${VERSION}.debian.tar.xz"
unp coturn-${VERSION}.tar.xz
mv coturn-${VERSION}.tar.xz coturn-${VERSION}.orig.tar.xz
cd coturn-${VERSION}/
