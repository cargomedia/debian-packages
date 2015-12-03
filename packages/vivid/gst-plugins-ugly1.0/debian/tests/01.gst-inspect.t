#!/bin/sh

test_description="Basic gstreamer installation verification"

. ./sharness.sh

is_plugin() {
    /usr/bin/gst-inspect-1.0 $1
}

for i in \
    asfdemux \
    dvdlpcmdec \
    dvdsub \
    realmedia \
    xingmux \
    a52dec \
    amrnb \
    amrwbdec \
    cdio \
    dvdreadsrc \
    lame \
    mad \
    mpeg2dec \
    siddec \
    twolame \
    x264; do
    test_expect_success "plugin ${i} must exist" "
        is_plugin ${i}
    ";
done

test_done
