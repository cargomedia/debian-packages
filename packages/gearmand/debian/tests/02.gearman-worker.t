#!/bin/sh

test_description="Check that the gearman-job-server starts"

. ./sharness.sh

test_expect_success "start worker" "
  gearman -w -t 2000 -c 1 -f count -- wc -l &
"

test_expect_success "start client" "
  printf 'one\ntwo\nthree\n' | gearman -P -t 2000 -f count | grep -qx 'count: 3'
"

test_done
