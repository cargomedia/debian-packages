#!/bin/sh
set -e
DIR="$(cd "$(dirname "${0}")" && pwd)"

PACKAGE='gearmand'
DIR_PACKAGE="${DIR}/packages/${PACKAGE}"
VERSION=$(cat "${DIR_PACKAGE}/version" | xargs)
URL=$(cat "${DIR_PACKAGE}/url" | xargs)

#cd "${DIR_PACKAGE}"
#rm -rf tmp/ && mkdir tmp/ && cd tmp/
#wget "${URL}"
#unp ${PACKAGE}-${VERSION}.tar.gz
#mv ${PACKAGE}-${VERSION}.tar.gz ${PACKAGE}_${VERSION}.orig.tar.gz
#cd ${PACKAGE}-${VERSION}/
#
#cp -r ../../debian ./debian
#mk-build-deps --install --remove debian/control
#dpkg-buildpackage -us -uc
#
#cd "${DIR_PACKAGE}"
#rm -rf pkg/ && mkdir pkg/
#mv tmp/*.deb pkg/
#rm -rf tmp/
#
#dpkg -i "${DIR_PACKAGE}/pkg/"*.deb
#
#PATH_TEST="${DIR_PACKAGE}/debian/tests/run-tests"
#if (test -e "${PATH_TEST}"); then
#  echo "Now executing tests..."
#  "${PATH_TEST}"
#fi

eval $(gpg-agent --daemon)
export GNUPGHOME='/root/.gnupg/'
echo $GNUPGHOME

PKG_LIST=$(perl -lne '/^Package: (.+)$/ && print $1' "${DIR_PACKAGE}/debian/control")
for PKG in ${PKG_LIST}; do
  echo
  echo "Adding ${PKG} to repo..."
  if (GNUPGHOME='~/.gnupg/' reprepro -b "${DIR}/repo" list wheezy "${PKG}" | grep -q "${PKG}"); then
    GNUPGHOME='~/.gnupg/' reprepro -b "${DIR}/repo" remove wheezy "${PKG}"
  fi
  GNUPGHOME='~/.gnupg/' reprepro -b "${DIR}/repo" includedeb wheezy "${DIR_PACKAGE}/pkg/${PKG}_"*.deb
done
