#!/bin/sh

VERSION='2.8.6'
wget "https://ffmpeg.org/releases/ffmpeg-${VERSION}.tar.gz"
unp ffmpeg-${VERSION}.tar.gz
mv ffmpeg-${VERSION}.tar.gz ffmpeg-cm_${VERSION}.orig.tar.gz
cd ffmpeg-${VERSION}/
