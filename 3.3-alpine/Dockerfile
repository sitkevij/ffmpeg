#
# ffmpeg - http://ffmpeg.org
# alpine https://hub.docker.com/_/alpine/
# hub https://hub.docker.com/r/sitkevij/ffmpeg/
#
# docker run --entrypoint "/bin/ls" sitkevij/ffmpeg -al /bin
# docker run sitkevij/ffmpeg -ss 00:00:02 -i 'https://github.com/sitkevij/test-media/blob/master/media/tears_of_steel_1080p-s05m-d10s.mov' -c:v copy -c:a copy out.mov
# https://raw.githubusercontent.com/sitkevij/test-media/master/media/tears_of_steel_1080p-s05m-d10s.mov 
#

FROM alpine:3.5

CMD         ["--help"] 
ENTRYPOINT  ["ffmpeg"]

LABEL org.label-schema.build-date=${BUILD_DATE} \
      org.label-schema.name="ffmpeg" \
      org.label-schema.description="ffmpeg Docker" \
      org.label-schema.url="https://hub.docker.com/r/sitkevij/ffmpeg/" \
      org.label-schema.vcs-url="https://github.com/sitkevij/vmaf" \
      org.label-schema.vendor="sitkevij" \
      org.label-schema.version="3.3.3"

ENV FFMPEG_VERSION=3.3.3 \
    BIN=/usr/bin

RUN apk update && apk upgrade && \

    apk add --update ca-certificates && \

    apk add \
        #  alpine-sdk \
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
        #  openssl \
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
    PATH="$BIN:$PATH" && \
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

