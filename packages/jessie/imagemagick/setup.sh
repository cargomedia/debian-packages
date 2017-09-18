#!/bin/sh

VERSION="6.9.9-12"

wget "https://github.com/ImageMagick/ImageMagick/archive/${VERSION}.tar.gz"
unp "${VERSION}.tar.gz"
mv "${VERSION}.tar.gz" "imagemagick_6.9.9.12.orig.tar.gz"
cd ImageMagick-${VERSION}
