#!/bin/sh

test_description="Basic installation check for turnserver"

. ./sharness.sh

test_expect_success "coturn init file is present" "
  ls /etc/init.d/coturn
"

test_expect_success "man page is present" "
  man -f turnserver | grep -q 'turnserver (1)'
"

test_expect_success "turnserver binary executes" "
  turnserver -h
"

test_done
