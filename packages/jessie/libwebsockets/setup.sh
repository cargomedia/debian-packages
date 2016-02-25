#!/bin/sh

VERSION="1.5-chrome47-firefox41"
wget "https://github.com/warmcat/libwebsockets/archive/v${VERSION}.zip"
unp "v${VERSION}.zip"
mv v${VERSION}.zip ${PACKAGE}-v${VERSION}.orig.zip
cd ${PACKAGE}-${VERSION}/
