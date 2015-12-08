#!/bin/sh

test_description="gst-libav installation verification"

. ./sharness.sh

test_expect_success "gstreamer1.0-libav correctly built and installed" "
  ls -l /usr/lib/gstreamer-1.0/libgstlibav.so
"
test_done
