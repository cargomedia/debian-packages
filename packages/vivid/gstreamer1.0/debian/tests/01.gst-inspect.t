#!/bin/sh

test_description="Basic gstreamer installation verification"

. ./sharness.sh

test_expect_success "Binary gst-inspect can be found " "
  for i in $(ls /usr/bin/gst-inspect*); do \${i} --version;done
"
test_done
