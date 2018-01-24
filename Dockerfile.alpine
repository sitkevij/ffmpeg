FROM {{from}}

ARG BUILD_DATE
ARG VCS_REF

CMD ["--help"]
ENTRYPOINT ["{{image}}"]
WORKDIR /tmp/{{image}}

LABEL org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.name="{{image}}" \
  org.label-schema.description="{{description}}" \
  org.label-schema.url="https://hub.docker.com/r/{{user}}/{{image}}/" \
  org.label-schema.usage="https://github.com/{{user}}/{{image}}/blob/master/README.md" \
  org.label-schema.vcs-ref="${VCS_REF}" \
  org.label-schema.vcs-url="https://github.com/{{user}}/{{image}}" \
  org.label-schema.vendor="{{user}}" \
  org.label-schema.version="{{version}}" \
  maintainer="https://github.com/{{user}}"

ENV SOFTWARE_VERSION="{{version}}"
ENV SOFTWARE_VERSION_URL="http://ffmpeg.org/releases/ffmpeg-${SOFTWARE_VERSION}.tar.bz2"
ENV BIN="/usr/bin"

RUN cd && \
apk update && \
apk upgrade && \
apk add \
  freetype-dev \
  gnutls-dev \
  lame-dev \
  libass-dev \
  libogg-dev \
  libtheora-dev \
  libvorbis-dev \
  libvpx-dev \
  libwebp-dev \
  libssh2 \
  opus-dev \
  rtmpdump-dev \
  x264-dev \
  x265-dev \
  yasm-dev && \
apk add --no-cache --virtual \
  .build-dependencies \
  build-base \
  bzip2 \
  coreutils \
  gnutls \
  nasm \
  tar \
  x264 && \
DIR=$(mktemp -d) && \
cd "${DIR}" && \
wget "${SOFTWARE_VERSION_URL}" && \
tar xjvf "ffmpeg-${SOFTWARE_VERSION}.tar.bz2" && \
cd ffmpeg* && \
PATH="$BIN:$PATH" && \
./configure --bindir="$BIN" --disable-debug \
  --disable-doc \
  --disable-ffplay \
  --enable-avresample \
  --enable-gnutls \
  --enable-gpl \
  --enable-libass \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-librtmp \
  --enable-libtheora \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libwebp \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree \
  --enable-postproc \
  --enable-small \
  --enable-version3 && \
make -j4 && \
make install && \
make distclean && \
rm -rf "${DIR}" && \
apk del --purge .build-dependencies && \
rm -rf /var/cache/apk/*
