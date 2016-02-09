#!/bin/sh

test_description="Check that the hpacucli tool runs"

. ./sharness.sh

test_expect_success "run hpacucli" "
  sudo hpacucli version | grep 'ACU CLI'
"

test_done
