#!/bin/sh

test_description="Basic janus-gateway-audioroom installation verification"

. ./sharness.sh

test_expect_success "libjanus_audioroom.so is installed" "
  ls /usr/lib/janus/plugins/libjanus_audioroom.so
"
test_done
