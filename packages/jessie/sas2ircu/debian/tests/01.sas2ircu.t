#!/bin/sh

test_description="Check that the sas2ircu tool runs"

. ./sharness.sh

test_expect_success "controller version" "
  sudo sas2ircu | grep 'LSI Corporation SAS2 IR Configuration Utility'
"

test_done
