FROM alpine:3.18

ARG BUILD_DATE
ARG VCS_REF

CMD ["--help"]
ENTRYPOINT ["ffmpeg"]
WORKDIR /tmp/ffmpeg

# see https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.created="${BUILD_DATE}" \
  org.opencontainers.image.title="ffmpeg" \
  org.opencontainers.image.description="Small ffmpeg Docker images for Alpine Linux, Ubuntu with VMAF option" \
  org.opencontainers.image.url="https://hub.docker.com/r/sitkevij/ffmpeg/" \
  org.opencontainers.image.documentation="https://github.com/sitkevij/ffmpeg/blob/master/README.md" \
  org.opencontainers.image.revision="${VCS_REF}" \
  org.opencontainers.image.source="https://github.com/sitkevij/ffmpeg" \
  org.opencontainers.image.vendor="sitkevij" \
  org.opencontainers.image.version="6.0" \
  org.opencontainers.image.authors="sitkevij" \
  maintainer="https://github.com/sitkevij"

ENV SOFTWARE_VERSION="6.0"
ENV SOFTWARE_VERSION_URL="http://ffmpeg.org/releases/ffmpeg-${SOFTWARE_VERSION}.tar.bz2"
ENV BIN="/usr/bin"

RUN cd && \
apk update && \
apk upgrade && \
apk add \
  # https://pkgs.alpinelinux.org/package/edge/main/x86_64/aom
  aom-dev \
  # https://pkgs.alpinelinux.org/package/edge/community/x86_64/svt-av1
  svt-av1-dev \
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
  --enable-gnutls \
  --enable-gpl \
  # https://trac.ffmpeg.org/wiki/Encode/AV1
  --enable-libaom \
  --enable-libsvtav1 \
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
rm -rf "/usr/lib/python3.11" && \
rm -rf "/usr/share" && \
rm -rf "/usr/local/lib" && \
apk del --purge .build-dependencies && \
rm -rf /var/cache/apk/*
