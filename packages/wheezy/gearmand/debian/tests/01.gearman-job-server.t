#!/bin/sh

test_description="Check that the gearman-job-server starts"

. ./sharness.sh

test_expect_success "service status" "
  service gearman-job-server status
"

test_expect_success "process running" "
  pgrep gearmand
"

test_done
