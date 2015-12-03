#!/bin/sh

VERSION="1.6.1"
wget "http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${VERSION}.tar.xz"
unp gst-plugins-base-${VERSION}.tar.xz
mv gst-plugins-base-${VERSION}.tar.xz ${PACKAGE}_${VERSION}.orig.tar.xz
cd gst-plugins-base-${VERSION}/
