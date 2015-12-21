#!/bin/sh

VERSION="0.8.0-9b07c6"
git clone "https://github.com/meetecho/janus-gateway.git"
mv janus-gateway ${PACKAGE}-${VERSION}
cd ${PACKAGE}-${VERSION}/
git checkout 9b07c628185e447ddecaeb6b31c9705a1e96c29e
