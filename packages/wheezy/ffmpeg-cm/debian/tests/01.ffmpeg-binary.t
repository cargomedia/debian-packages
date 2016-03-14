#!/bin/sh

test_description="Basic ffmpeg installation verification"

. ./sharness.sh

test_expect_success "ffmpeg binary is present" "
  ffmpeg -version
"

test_done
