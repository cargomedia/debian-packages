#!/bin/sh

test_description="Check that the hpacuscripting tool runs"

. ./sharness.sh

test_expect_success "run hpacuscripting" "
  echo '' | hpacuscripting | grep 'Restricts operations to internal controllers'
"

test_done
