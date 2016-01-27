#!/bin/sh

VERSION="2.8.5"
wget "https://ffmpeg.org/releases/ffmpeg-${VERSION}.tar.xz"
unp ffmpeg-${VERSION}.tar.xz
cp ffmpeg-${VERSION}.tar.xz ffmpeg_${VERSION}.orig.tar.xz
cd ffmpeg-${VERSION}/
