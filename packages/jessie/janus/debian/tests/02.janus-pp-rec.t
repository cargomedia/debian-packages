#!/bin/sh

test_description="janus-pp-rec test"

. ./sharness.sh

test_expect_success "janus-pp-rec is on the path" "
  which janus-pp-rec
"

test_done
