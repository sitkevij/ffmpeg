#
# ffmpeg - http://ffmpeg.org
# alpine https://hub.docker.com/_/alpine/
# hub https://hub.docker.com/r/sitkevij/ffmpeg/
#
FROM alpine:3.5

CMD         ["--help"]
ENTRYPOINT  ["/usr/bin/ffmpeg"]
WORKDIR     /tmp/ffmpeg-workdir

ENV FFMPEG_VERSION=3.3.3 \
    BIN=/usr/bin

RUN apk update && apk upgrade && \

    apk add --update ca-certificates && \

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
        opus-dev \
        rtmpdump-dev \
        x264-dev \
        x265-dev \
        yasm-dev \ 
        zlib-dev && \ 

    apk add --no-cache --virtual \
        .build-dependencies \
        build-base \
        bzip2 \
        coreutils \
        gnutls \
        nasm \
        tar \
        x264 && \

# ffmepg make, install, rm tmp 
DIR=$(mktemp -d) && cd ${DIR} && \
    wget http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.gz && \
    tar xzvf ffmpeg-${FFMPEG_VERSION}.tar.gz && \
    cd ffmpeg* && \
    ./configure --bindir="$BIN" \
                --disable-debug \
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
    make && \
    make install && \
    make distclean && \
    rm -rf ${DIR}  && \

# clean
    apk del --purge .build-dependencies && \
    rm -rf /var/cache/apk/*

