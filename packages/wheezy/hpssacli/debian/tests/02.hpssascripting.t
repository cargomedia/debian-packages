#!/bin/sh

test_description="Check that the hpssascripting tool runs"

. ./sharness.sh

test_expect_success "run hpssascripting" "
  echo '' | hpssascripting | grep 'Restricts operations to internal controllers'
"

test_done
