#!/bin/sh

test_description="Check that the storcli tool runs"

. ./sharness.sh

test_expect_success "controller version" "
  sudo storcli -V
"

test_done
