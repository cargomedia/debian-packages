#!/bin/sh

test_description="Check that the storcli tool runs"

. ./sharness.sh

test_expect_success "controller version" "
  storcli -V
"

test_done
