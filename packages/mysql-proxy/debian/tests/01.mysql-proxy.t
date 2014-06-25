#!/bin/sh

test_description="Check that the mysql-proxy binary runs"

. ./sharness.sh

test_expect_success "binary runs" "
  mysql-proxy --version
"

test_done
