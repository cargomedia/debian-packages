#!/bin/sh

VERSION="0.8.4"
wget "http://dev.mysql.com/get/Downloads/MySQL-Proxy/mysql-proxy-${VERSION}.tar.gz"
unp ${PACKAGE}-${VERSION}.tar.gz
mv ${PACKAGE}-${VERSION}.tar.gz ${PACKAGE}_${VERSION}.orig.tar.gz
cd ${PACKAGE}-${VERSION}/
