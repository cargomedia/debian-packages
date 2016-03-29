#!/bin/sh
set -e
DIR="$(cd "$(dirname "${0}")" && pwd)"

usage() { echo "Usage: ${0} -c <codename> -p <package>" 1>&2; exit 1; }

exitIfRoot() {
  if [ "$(id -u)" -eq "0" ]; then
      echo "Don't execute this script as root user!"
      exit 1
  fi
}

exitIfRoot

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
sudo mk-build-deps --install --remove debian/control
dpkg-buildpackage -us -uc

cd "${DIR_PACKAGE}"
mkdir -p pkg/
mv tmp/*.deb pkg/
rm -rf tmp/

if ! (sudo dpkg -i "${DIR_PACKAGE}/pkg/"*.deb); then
    sudo apt-get install -f
fi

PATH_TEST="${DIR_PACKAGE}/debian/tests/run-tests"
if (test -e "${PATH_TEST}"); then
  echo "Now executing tests..."
  "${PATH_TEST}"
fi
