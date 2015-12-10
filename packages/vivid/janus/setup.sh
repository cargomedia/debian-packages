#!/bin/sh

VERSION="0.8.0-b5865b"
git clone "https://github.com/meetecho/janus-gateway.git"
mv janus-gateway ${PACKAGE}-${VERSION}
cd ${PACKAGE}-${VERSION}/
git checkout b5865bdd56569ae660bf945323705010ae55d7fc
