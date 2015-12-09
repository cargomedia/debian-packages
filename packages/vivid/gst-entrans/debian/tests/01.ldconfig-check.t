#!/bin/sh

test_description="Basic gst-entrans installation verification"

. ./sharness.sh

test_expect_success "libgstentrans is installed" "
  ldconfig -p | grep libgstentrans
"
test_done
