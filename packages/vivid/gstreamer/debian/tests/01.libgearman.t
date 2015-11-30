#!/bin/sh

test_description="Check that the gstreamer library is available"

test_expect_success "foo" "
  gcc gstreamer.c
"

test_done
