#!/bin/sh

test_description="Check that the gstreamer headers are available"

. ./sharness.sh

test_expect_success "Headers can be included" "
  echo \"#include <gst/gst.h>\nint main() {  return 0; }\" > source.c

  gcc -Wall source.c $(pkg-config --cflags --libs gstreamer-1.0) > /tmp/gcc 2>&1
"

test_done
