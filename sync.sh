#!/bin/sh
set -e
DIR="$(cd "$(dirname "${0}")" && pwd)"

test -e ~/.s3cfg || s3cmd --configure
s3cmd --verbose --acl-public --delete-removed  sync "${DIR}/repo/" s3://cargomedia-debian-packages/
