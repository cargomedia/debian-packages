#!/bin/sh

test_description="Basic libsrtp verification"

. ./sharness.sh

test_expect_success "libsrtp is installed" "
  ls /usr/lib/libsrtp.a
"

test_done
