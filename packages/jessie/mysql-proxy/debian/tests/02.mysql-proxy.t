#!/bin/sh

test_description="Check that the mysql-proxy service runs"

. ./sharness.sh

test_expect_success "systemd service runs" "
  sudo systemctl status mysql-proxy
"

test_done
