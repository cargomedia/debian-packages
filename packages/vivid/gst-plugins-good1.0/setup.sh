#!/bin/sh

VERSION="1.8.0"
wget "http://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${VERSION}.tar.xz"
unp gst-plugins-good-${VERSION}.tar.xz
mv gst-plugins-good-${VERSION}.tar.xz ${PACKAGE}_${VERSION}.orig.tar.xz
cd gst-plugins-good-${VERSION}/
