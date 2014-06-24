#!/bin/sh

VERSION="1.1.12"
wget "https://launchpad.net/gearmand/1.2/${VERSION}/+download/gearmand-${VERSION}.tar.gz"
unp ${PACKAGE}-${VERSION}.tar.gz
mv ${PACKAGE}-${VERSION}.tar.gz ${PACKAGE}_${VERSION}.orig.tar.gz
cd ${PACKAGE}-${VERSION}/

cp -r ../../debian ./debian
