#!/bin/sh

test_description="Basic gstreamer bad plugin verification"

. ./sharness.sh

is_plugin() {
    /usr/bin/gst-inspect-1.0 $1
}

for i in \
  adder \
  app\
  audioconvert \
  audiorate \
  audioresample \
  audiotestsrc \
  encoding \
  gio \
  playback \
  subparse \
  tcp \
  typefind \
  videoconvert \
  videorate \
  videoscale \
  videotestsrc \
  volume \
  alsa \
  cdparanoia \
  libvisual \
  ogg \
  pango \
  theora \
  vorbis \
  ximagesink \
  xvimagesink; do
    test_expect_success "plugin ${i} must exist" "
        is_plugin ${i}
    ";
done

test_done
