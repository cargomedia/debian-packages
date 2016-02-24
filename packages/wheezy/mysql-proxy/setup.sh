#!/bin/sh

VERSION="0.8.5"
wget "https://downloads.mysql.com/archives/get/file/${PACKAGE}-${VERSION}.tar.gz"

gpg --import ../mysql_pubkey.asc
cp ../${PACKAGE}-${VERSION}.tar.gz.asc .

if (gpg --verify ${PACKAGE}-${VERSION}.tar.gz.asc); then
    unp ${PACKAGE}-${VERSION}.tar.gz
    mv ${PACKAGE}-${VERSION}.tar.gz ${PACKAGE}_${VERSION}.orig.tar.gz
    cd ${PACKAGE}-${VERSION}/
else
    echo "Signature key mismatch - Build stopped"
    exit 1
fi
