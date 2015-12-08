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
    camerabin2 \
    coloreffects \
    compositor \
    dataurisrc \
    debugutils \
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
    librfb \
    liveadder \
    midi \
    mpegdemux \
    mpegpsmux \
    mpegtsdemux \
    mpegtsmux \
    mxf \
    onvif \
    pcapparse \
    pnm \
    rawparse \
    removesilence \
    rtp \
    sdp \
    segmentclip \
    siren \
    smooth \
    speed \
    stereo \
    subenc \
    videofilters \
    videoparsers \
    videosignal \
    vmnc \
    y4m \
    yadif \
    assrender \
	bs2b \
	bz2 \
	chromaprint \
	curl \
	dash \
	decklink \
	dfbvideosink  \
	dtls \
	dtsdec \
	dvb \
	faad \
	fbdevsink \
	flite \
	fluidsynth \
	gl \
	gme \
	gsmenc gsmdec \
	gtk \
	hls \
	kate \
	ladspa \
	libde265 \
	libmms \
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
	sfdec sfenc \
	shm \
	smoothstreaming \
	soundtouch \
	spandsp \
	srtp \
	uvch264 \
	vcdsrc \
	vo-aacenc \
	vo-amrwbenc \
	wayland  \
	webp  \
	wildmidi \
	x265 \
	zbar; do
    test_expect_success "plugin ${i} must exist" "
        is_plugin ${i}
    ";
done

test_done
