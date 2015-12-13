#!/bin/sh

VERSION="2.00.21811"
wget "http://download.adaptec.com/raid/storage_manager/arcconf_v$(echo ${VERSION} | tr '.' '_').zip"
mkdir ${PACKAGE}-${VERSION}
unzip -d ${PACKAGE}-${VERSION} arcconf_*.zip
cd ${PACKAGE}-${VERSION}
