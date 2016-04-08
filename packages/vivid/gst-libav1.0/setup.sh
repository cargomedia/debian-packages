#!/bin/sh

VERSION="1.8.0"
wget "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${VERSION}.tar.xz"
unp gst-libav-${VERSION}.tar.xz
mv gst-libav-${VERSION}.tar.xz ${PACKAGE}_${VERSION}.orig.tar.xz
cd gst-libav-${VERSION}/
