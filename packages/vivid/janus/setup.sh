#!/bin/sh

VERSION="0.9.0-adf88c"
git clone "https://github.com/meetecho/janus-gateway.git"
mv janus-gateway ${PACKAGE}-${VERSION}
cd ${PACKAGE}-${VERSION}/
git checkout adf88c5a7f7c103b28a65f6229cc6cd7ed64dcef
