#!/bin/sh

test_description="Check that the arcconf tool runs"

. ./sharness.sh

test_expect_success "controller version" "
  sudo arcconf GETVERSION
"

test_done
