#!/bin/sh

VERSION="1.6.1"
wget "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${VERSION}.tar.xz"
unp gstreamer-${VERSION}.tar.xz
mv gstreamer-${VERSION}.tar.xz ${PACKAGE}_${VERSION}.orig.tar.xz
cd gstreamer-${VERSION}/
