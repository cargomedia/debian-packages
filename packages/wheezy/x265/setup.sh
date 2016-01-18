#!/bin/sh

VERSION="1.7"
wget "http://archive.ubuntu.com/ubuntu/pool/universe/x/x265/x265_${VERSION}.orig.tar.gz"
unp x265_${VERSION}.orig.tar.gz
mv x265_${VERSION}.orig.tar.gz x265_${VERSION}-4.orig.tar.gz
cd x265_${VERSION}/
