#!/bin/sh

test_description="Basic installation check for ffmpeg"

. ./sharness.sh

test_expect_success "ffmpeg binary executes" "
  ffmpeg -codecs
"

test_done
