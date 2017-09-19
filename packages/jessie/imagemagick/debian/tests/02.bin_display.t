#!/bin/sh

test_description="Binary 'display' is executable and return correct version"

. ./sharness.sh


test_expect_success "run display" "
    display -version | grep 'ImageMagick 6.9.9-12'
"
test_done

