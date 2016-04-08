#!/bin/sh

VERSION="1.8.0"
wget "http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${VERSION}.tar.xz"
unp gst-plugins-bad-${VERSION}.tar.xz
mv gst-plugins-bad-${VERSION}.tar.xz ${PACKAGE}_${VERSION}.orig.tar.xz
cd gst-plugins-bad-${VERSION}/
