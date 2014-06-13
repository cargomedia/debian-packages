#!/bin/sh
set -e
cd "$(dirname "${0}")"

PACKAGE='gearmand'
VERSION='0.33'
URL="https://launchpad.net/${PACKAGE}/1.0/${VERSION}/+download/${PACKAGE}-${VERSION}.tar.gz"

mkdir -p tmp/
cd tmp/
test -e ${PACKAGE}-${VERSION}.tar.gz || wget https://launchpad.net/gearmand/1.0/${VERSION}/+download/${PACKAGE}-${VERSION}.tar.gz
rm -rf ${PACKAGE}-${VERSION}/
unp ${PACKAGE}-${VERSION}.tar.gz
cp ${PACKAGE}-${VERSION}.tar.gz ${PACKAGE}_${VERSION}.orig.tar.gz
cd ${PACKAGE}-${VERSION}/

cp -r ../../debian ./debian
mk-build-deps --install --remove debian/control
dpkg-buildpackage -us -uc
