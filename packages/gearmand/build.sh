#!/bin/sh
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PACKAGE='gearmand'
VERSION='1.1.12'
URL="https://launchpad.net/${PACKAGE}/1.2/${VERSION}/+download/${PACKAGE}-${VERSION}.tar.gz"

cd ${DIR}
mkdir -p tmp/
cd tmp/
test -e ${PACKAGE}-${VERSION}.tar.gz || wget "${URL}"
rm -rf ${PACKAGE}-${VERSION}/
unp ${PACKAGE}-${VERSION}.tar.gz
cp ${PACKAGE}-${VERSION}.tar.gz ${PACKAGE}_${VERSION}.orig.tar.gz
cd ${PACKAGE}-${VERSION}/

cp -r ../../debian ./debian
mk-build-deps --install --remove debian/control
dpkg-buildpackage -us -uc

cd ${DIR}
mkdir -p pkg/
mv tmp/*.deb pkg/
rm -rf tmp/
