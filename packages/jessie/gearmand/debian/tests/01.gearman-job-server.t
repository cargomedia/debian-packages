#!/bin/sh

test_description="Check that the gearman-job-server starts"

. ./sharness.sh

test_expect_success "service status" "
  sudo systemctl status gearman-job-server
"

test_done
