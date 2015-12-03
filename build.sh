#!/bin/sh
set -e
DIR="$(cd "$(dirname "${0}")" && pwd)"

usage() { echo "Usage: ${0} -c <codename> -p <package>" 1>&2; exit 1; }

while getopts "c:p:" o; do
    case "${o}" in
        c)
            CODENAME=${OPTARG}
            ;;
        p)
            PACKAGE=${OPTARG}
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
if [ -z "${PACKAGE}" ]; then
    usage
fi

DIR_PACKAGE="${DIR}/packages/${CODENAME}/${PACKAGE}"

cd "${DIR_PACKAGE}"
rm -rf tmp/ && mkdir tmp/ && cd tmp/
. "${DIR_PACKAGE}/setup.sh"
cp -r "${DIR_PACKAGE}/debian" ./debian
mk-build-deps --install --remove debian/control
dpkg-buildpackage -us -uc

cd "${DIR_PACKAGE}"
rm -rf pkg/ && mkdir pkg/
mv tmp/*.deb pkg/
rm -rf tmp/

if ! $(dpkg -i "${DIR_PACKAGE}/pkg/"*.deb); then
    apt-get install -f
fi

PATH_TEST="${DIR_PACKAGE}/debian/tests/run-tests"
if (test -e "${PATH_TEST}"); then
  echo "Now executing tests..."
  "${PATH_TEST}"
fi

eval $(gpg-agent --daemon)

PKG_LIST=$(perl -lne '/^Package: (.+)$/ && print $1' "${DIR_PACKAGE}/debian/control")
for PKG in ${PKG_LIST}; do
  echo
  echo "Adding ${PKG} to repo..."
  if (reprepro -b "${DIR}/repo" list "${CODENAME}" "${PKG}" | grep -q "${PKG}"); then
    reprepro -b "${DIR}/repo" remove "${CODENAME}" "${PKG}"
  fi
  reprepro -b "${DIR}/repo" includedeb "${CODENAME}" "${DIR_PACKAGE}/pkg/${PKG}_"*.deb
done
