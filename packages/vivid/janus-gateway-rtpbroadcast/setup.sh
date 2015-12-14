#!/bin/sh

VERSION="0.0.1"
wget https://github.com/cargomedia/janus-gateway-rtpbroadcast/archive/${VERSION}.tar.gz
unp ${VERSION}.tar.gz
mv ${VERSION}.tar.gz ${PACKAGE}_${VERSION}.orig.tar.gz
cd ${PACKAGE}-${VERSION}
