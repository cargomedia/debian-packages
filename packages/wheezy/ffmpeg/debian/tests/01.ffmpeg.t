#!/bin/sh

test_description="Check that the ffmpeg exec runs"

. ./sharness.sh

test_expect_success "ffmpeg exits with 0" "
  ffmpeg -codecs
"

test_done
