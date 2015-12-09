#!/bin/sh
set -e
DIR="$(cd "$(dirname "${0}")" && pwd)"

usage() { echo "Usage: ${0} -c <codename>" 1>&2; exit 1; }

while getopts "c:p:" o; do
    case "${o}" in
        c)
            CODENAME=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${CODENAME}" ]; then
    usage
fi

eval $(gpg-agent --daemon)

includedeb() {
    reprepro -b "${DIR}/repo" includedeb "${CODENAME}" "${DIR_PACKAGE}/pkg/${PKG}_"*.deb
}

removedeb() {
    reprepro -b "${DIR}/repo" remove "${CODENAME}" "${PKG}"
}

check() {
    reprepro -b "${DIR}/repo" check "${CODENAME}"
}

checkpool() {
    reprepro -b "${DIR}/repo" checkpool
}


DIR_PACKAGES="${DIR}/packages/${CODENAME}/"
for DIR_PACKAGE in `find ${DIR_PACKAGES} -maxdepth 1 -mindepth 1 -type d`; do
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

if (check && checkpool); then
    test -e ~/.s3cfg || s3cmd --configure
    s3cmd --verbose --acl-public --delete-removed --cf-invalidate sync "${DIR}/repo/" s3://cargomedia-debian-packages/
fi

