#!/bin/sh

VERSION="1.17.08"
wget "http://docs.avagotech.com/docs-and-downloads/https:/avagodocs.s3.amazonaws.com:443/docs-and-downloads/raid-controllers/raid-controllers-common-files/MR_SAS_StorCLI_${VERSION}.zip"
unzip -d storcli MR_SAS_StorCLI_*.zip
unzip -d storcli-all-os storcli/storcli_all_os.zip

unp storcli-all-os/Ubuntu/storcli_1.17.08_all.deb
mkdir ${PACKAGE}-${VERSION}
tar x --file data.tar.gz --directory ${PACKAGE}-${VERSION}
cd ${PACKAGE}-${VERSION}
