#!/bin/sh

test_description="Basic gstreamer installation verification"

. ./sharness.sh

is_plugin() {
    /usr/bin/gst-inspect-1.0 $1
}

for i in \
    alpha \
    apetag \
    audiofx \
    audioparsers \
    auparse \
    autodetect \
    avi \
    camerabin \
    cutter \
    deinterlace \
    dtmf \
    effectv \
    equalizer \
    flv \
    flxdec \
    goom \
    goom2k1 \
    icydemux \
    id3demux \
    imagefreeze \
    interleave \
    isomp4 \
    jpegformat \
    alaw \
    level \
    matroska \
    monoscope \
    multifile \
    multipart \
    replaygain \
    rtp \
    rtpmanager \
    rtsp \
    shapewipe \
    smpte \
    spectrum \
    udp \
    videobox \
    videocrop \
    videofilter \
    videomixer \
    wavenc \
    wavparse \
    y4menc \
    1394 \
    aasink \
    cacasink \
    cairo \
    dv \
    flac \
    gdkpixbuf \
    jack \
    jpeg; do
    test_expect_success "plugin ${i} must exist" "
        is_plugin ${i}
    ";
done

test_done
