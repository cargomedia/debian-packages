#!/bin/sh

test_description="Basic Janus installation verification"

. ./sharness.sh

test_expect_success "Janus Service is installed and running" "
  service janus status
"

test_expect_success "Janus Daemon process is alive" "
  ps aux |grep '[/]usr/bin/janus'
"
test_done
