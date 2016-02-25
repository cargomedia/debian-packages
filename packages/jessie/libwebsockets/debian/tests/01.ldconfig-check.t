#!/bin/sh

test_description="Basic libwebsockets installation verification"

. ./sharness.sh

test_expect_success "libwebsockets is installed" "
  sudo ldconfig -p | grep libwebsockets
"
test_done
