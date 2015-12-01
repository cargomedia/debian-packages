#!/bin/sh

test_description="Check that the gstreamer library is available"

. ./sharness.sh

test_expect_success "Run binary" "
  gst-launch-1.0 --version
"

test_done
