#!/bin/sh

VERSION="0.9.0-2ef5bb"
git clone "https://github.com/meetecho/janus-gateway.git"
mv janus-gateway ${PACKAGE}-${VERSION}
cd ${PACKAGE}-${VERSION}/
git checkout 2ef5bb8d9e4f8f22f651e0153957eabbc62fcf95

