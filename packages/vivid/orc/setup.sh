#!/bin/sh

VERSION="0.4.24"
wget "http://gstreamer.freedesktop.org/src/orc/orc-${VERSION}.tar.xz"
unp orc-${VERSION}.tar.xz
mv orc-${VERSION}.tar.xz ${PACKAGE}_${VERSION}.orig.tar.xz
cd orc-${VERSION}/
