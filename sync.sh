#!/bin/sh
set -e
DIR="$(cd "$(dirname "${0}")" && pwd)"

eval $(gpg-agent --daemon)

includedeb() {
    reprepro -b "${DIR}/repo" includedeb "${CODENAME}" "${DIR_PACKAGE}/pkg/${PKG}_"*.deb
}

removedeb() {
    reprepro -b "${DIR}/repo" remove "${CODENAME}" "${PKG}"
}


for DIR_CODENAME in `find ${DIR}/packages/ -maxdepth 1 -mindepth 1 -type d`; do
  CODENAME=$(basename "${DIR_CODENAME}")
  echo "Building repo for codename ${CODENAME}…"

  for DIR_PACKAGE in `find ${DIR_CODENAME} -maxdepth 1 -mindepth 1 -type d`; do
    PKG_LIST=$(perl -lne '/^Package: (.+)$/ && print $1' "${DIR_PACKAGE}/debian/control")
    for PKG in ${PKG_LIST}; do
      echo
      echo "Adding ${PKG} to repo..."
      if !(includedeb); then
          # failed to include deb, this could be due to:
          # - already a package with the same name/version, but with different checksums.
          # let's delete the existing package
          removedeb
          includedeb
      fi
    done
  done

  if ! (reprepro -b "${DIR}/repo" check "${CODENAME}"); then
    echo "Repo check for ${CODENAME} failed"
    exit 1
  fi
done

if ! (reprepro -b "${DIR}/repo" checkpool); then
  echo "Repo pool check failed"
  exit 1
fi

test -e /vagrant/.s3cfg || s3cmd -c /vagrant/.s3cfg --configure
s3cmd -c /vagrant/.s3cfg --verbose --acl-public --delete-removed --cf-invalidate sync "${DIR}/repo/" s3://cargomedia-debian-packages/
