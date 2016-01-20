#!/bin/sh

test_description="Check that the hpssacli tool runs"

. ./sharness.sh

test_expect_success "run hpssacli" "
  sudo hpssacli version | grep 'HPSSACLI Version'
"

test_done
