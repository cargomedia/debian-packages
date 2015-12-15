#!/bin/sh

VERSION="1.5-chrome47-firefox41"
wget "https://github.com/warmcat/libwebsockets/archive/v${VERSION}.tar.gz"
unp "v${VERSION}.tar.gz"
mv v${VERSION}.tar.gz ${PACKAGE}-v${VERSION}.orig.tar.gz
cd ${PACKAGE}-${VERSION}/
