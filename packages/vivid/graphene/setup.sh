#!/bin/sh

VERSION="1.2.10"
wget "https://github.com/ebassi/graphene/archive/${VERSION}.zip"
unp ${VERSION}.zip
mv ${VERSION}.zip ${PACKAGE}-${VERSION}.orig.zip
cd ${PACKAGE}-${VERSION}
