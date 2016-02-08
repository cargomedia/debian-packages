#!/bin/sh

sudo apt-get -y install rpm2cpio cpio

VERSION="2.30.6.0"
mkdir ${PACKAGE}-${VERSION}
cd ${PACKAGE}-${VERSION}
wget "http://downloads.linux.hpe.com/SDR/repo/spp/2015.10.0_supspp_rhel7.2_x86_64/hpssacli-2.30-6.0.x86_64.rpm"
unp hpssacli-*.rpm
