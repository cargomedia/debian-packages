#!/bin/sh

VERSION="0.9.0-088882"
git clone "https://github.com/meetecho/janus-gateway.git"
mv janus-gateway ${PACKAGE}-${VERSION}
cd ${PACKAGE}-${VERSION}/
git checkout 08888212c99f715061bcc833f47dd36aabb382ed
