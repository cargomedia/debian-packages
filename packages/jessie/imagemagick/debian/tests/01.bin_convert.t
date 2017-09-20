#!/bin/sh

test_description="Binary 'convert' is executable and return correct version"

. ./sharness.sh


test_expect_success "run convert" "
    convert -version | grep 'ImageMagick 6.9.9-12'
"
test_done

