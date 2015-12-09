#!/bin/sh

test_description="Basic gstreamer bad plugin verification"

. ./sharness.sh

is_plugin() {
    /usr/bin/gst-inspect-1.0 $1
}

for i in \
    accurip \
    adpcmdec \
    adpcmenc \
    aiff \
    asfmux \
    audiofxbad \
    audiomixer \
    audiovisualizers \
    autoconvert \
    bayer \
    coloreffects \
    compositor \
    dataurisrc \
    dvbsuboverlay \
    dvdspu \
    festival \
    fieldanalysis \
    freeverb \
    frei0r \
    gaudieffects \
    gdp \
    geometrictransform \
    id3tag \
    inter \
    interlace \
    ivfparse \
    ivtc \
    jp2kdecimator \
    jpegformat \
    liveadder \
    midi \
    mpegpsmux \
    mpegtsdemux \
    mpegtsmux \
    mxf \
    pcapparse \
    pnm \
    rawparse \
    removesilence \
    rtp \
    sdp \
    segmentclip \
    smooth \
    speed \
    stereo \
    subenc \
    videosignal \
    vmnc \
    yadif \
    assrender \
	bs2b \
	bz2 \
	chromaprint \
	curl \
	decklink \
	dtls \
	dtsdec \
	dvb \
	faad \
	fbdevsink \
	flite \
	gsmenc gsmdec \
	kate \
	ladspa \
	libde265 \
	mimic \
	modplug \
	mpeg2enc \
	mpg123 \
	mplex \
	ofa \
	openal \
	opencv \
	openexr \
	openjpeg \
	opus \
	resindvd \
	rsvg \
	rtmp \
	sbc \
	schro \
	sfdec \
	shm \
	smoothstreaming \
	soundtouch \
	spandsp \
	srtp \
	uvch264 \
	vcdsrc \
	webp  \
	wildmidi \
	x265 \
	zbar; do
    test_expect_success "plugin ${i} must exist" "
        is_plugin ${i}
    ";
done

test_done
