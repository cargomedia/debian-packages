#!/bin/sh

test_description="Check that the gearman-job-server starts"

. ./sharness.sh

test_expect_success "start worker" "
  sudo gearman -w -h 127.0.0.1 -t 20000 -c 1 -f count -- wc -l &
"

test_expect_success "start client" "
  printf 'one\ntwo\nthree\n' | sudo gearman -P -f count | grep -qx 'count: 3'
"

test_done
