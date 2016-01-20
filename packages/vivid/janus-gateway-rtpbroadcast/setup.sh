#!/bin/sh

VERSION="0.0.9"
wget https://github.com/cargomedia/janus-gateway-rtpbroadcast/archive/v${VERSION}.tar.gz
unp v${VERSION}.tar.gz
mv v${VERSION}.tar.gz ${PACKAGE}_${VERSION}.orig.tar.gz
cd ${PACKAGE}-${VERSION}
