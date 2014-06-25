#!/bin/sh

VERSION="0.8.1"
wget "https://launchpad.net/mysql-proxy/0.8/${VERSION}/+download/mysql-proxy-${VERSION}.tar.gz"
unp ${PACKAGE}-${VERSION}.tar.gz
mv ${PACKAGE}-${VERSION}.tar.gz ${PACKAGE}_${VERSION}.orig.tar.gz
cd ${PACKAGE}-${VERSION}/
