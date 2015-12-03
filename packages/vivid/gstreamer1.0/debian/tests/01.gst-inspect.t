#!/bin/sh

test_description="Basic gstreamer installation verification"

. ./sharness.sh

test_expect_success "Binary gst-inspect can be found and returns GStreamer 1.6.1" "
  /usr/bin/gst-inspect-1.0 --version | grep -qE '^GStreamer 1.6.1$'
"
test_done
