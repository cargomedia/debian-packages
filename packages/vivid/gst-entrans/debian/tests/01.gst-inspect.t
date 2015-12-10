#!/bin/sh

test_description="Basic gst-entrans installation verification"

. ./sharness.sh

test_expect_success "libgstentrans is installed" "
  gst-inspect-1.0 | grep entrans
"
test_done
