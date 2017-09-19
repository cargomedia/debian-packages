#!/bin/sh
VERSION='3.4.3'
wget "https://pecl.php.net/get/imagick-${VERSION}.tgz"
mv imagick-${VERSION}.tgz php-imagick_${VERSION}.orig.tar.gz
mkdir php-imagick_${VERSION}
cd php-imagick_${VERSION}
unp ../php-imagick_${VERSION}.orig.tar.gz
