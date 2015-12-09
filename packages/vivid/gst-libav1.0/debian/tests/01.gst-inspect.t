#!/bin/sh

test_description="gst-libav installation verification"

. ./sharness.sh

test_expect_success "gstreamer1.0-libav correctly built and installed" "
  ldconfig -p | grep libgstlibav
"
test_done
