#!/bin/sh

VERSION="20.00.00.00"
wget "http://docs.avagotech.com/docs-and-downloads/host-bus-adapters/host-bus-adapters-common-files/sas_sata_6g_p20/SAS2IRCU_P20.zip"
unzip -d ${PACKAGE}-${VERSION} SAS2IRCU_*.zip
cd ${PACKAGE}-${VERSION}
