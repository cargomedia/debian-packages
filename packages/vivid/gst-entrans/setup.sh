#!/bin/sh

VERSION="1.0.3"
wget "http://downloads.sourceforge.net/project/gentrans/gst-entrans/1.0.3/gst-entrans-${VERSION}.tar.gz"
unp gst-entrans-${VERSION}.tar.gz
mv gst-entrans-${VERSION}.tar.gz ${PACKAGE}_${VERSION}.orig.tar.gz
cd gst-entrans-${VERSION}
