#!/bin/sh

test_description="Basic janus-gateway-rtbbroadcast installation verification"

. ./sharness.sh

test_expect_success "libjanus_rtpbroadcast.so is installed" "
  ls /usr/lib/janus/plugins/libjanus_rtpbroadcast.so
"
test_done
