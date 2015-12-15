#!/bin/sh

VERSION="1.5.3"
wget "https://github.com/cisco/libsrtp/archive/v${VERSION}.zip"
unp "v${VERSION}.zip"
mv v${VERSION}.zip ${PACKAGE}_${VERSION}.orig.zip
cd ${PACKAGE}-${VERSION}/
