#!/bin/sh

VERSION="1.6.1"
wget "http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${VERSION}.tar.xz"
unp gst-plugins-ugly-${VERSION}.tar.xz
mv gst-plugins-ugly-${VERSION}.tar.xz ${PACKAGE}_${VERSION}.orig.tar.xz
cd gst-plugins-ugly-${VERSION}/
