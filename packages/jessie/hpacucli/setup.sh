#!/bin/sh

sudo apt-get -y install rpm2cpio cpio

VERSION="9.40.12.0"
mkdir ${PACKAGE}-${VERSION}
cd ${PACKAGE}-${VERSION}
wget "http://whp-aus1.cold.extweb.hp.com/pub/softlib2/software1/pubsw-linux/p1257348637/v80070/hpacucli-9.40-12.0.x86_64.rpm"
unp hpacucli-*.rpm
