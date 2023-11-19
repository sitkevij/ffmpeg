# ffmpeg 4.3 alpine 3

## Running

```sh
docker run --rm sitkevij/ffmpeg:4.3-alpine-3
```

## Pulling from Docker Hub

```sh
docker pull sitkevij/ffmpeg:4.3-alpine-3
```

## Building from source

```sh
git clone https://github.com/sitkevij/ffmpeg.git && \
cd ffmpeg && \
chmod a+x build-local.sh && \
./build-local.sh sitkevij ffmpeg-4.3-alpine && \
docker run --rm sitkevij/ffmpeg:4.3-alpine-3
```

## Buildconf

```sh
ffmpeg version 4.0 Copyright (c) 2000-2017 the FFmpeg developers
built with gcc 6.4.0 (Alpine 6.4.0)
configuration: --bindir=/usr/bin --disable-debug --disable-doc --disable-ffplay --enable-avresample --enable-gnutls --enable-gpl --enable-libass --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-librtmp --enable-libtheora --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-nonfree --enable-postproc --enable-small --enable-version3
libavutil      55. 78.100 / 55. 78.100
libavcodec     57.107.100 / 57.107.100
libavformat    57. 83.100 / 57. 83.100
libavdevice    57. 10.100 / 57. 10.100
libavfilter     6.107.100 /  6.107.100
libavresample   3.  7.  0 /  3.  7.  0
libswscale      4.  8.100 /  4.  8.100
libswresample   2.  9.100 /  2.  9.100
libpostproc    54.  7.100 / 54.  7.100

  configuration:
    --bindir=/usr/bin
    --disable-debug
    --disable-doc
    --disable-ffplay
    --enable-avresample
    --enable-gnutls
    --enable-gpl
    --enable-libass
    --enable-libfreetype
    --enable-libmp3lame
    --enable-libopus
    --enable-librtmp
    --enable-libtheora
    --enable-libvorbis
    --enable-libvpx
    --enable-libwebp
    --enable-libx264
    --enable-libx265
    --enable-nonfree
    --enable-postproc
    --enable-small
    --enable-version3
```

## Git repo

https://github.com/sitkevij/ffmpeg

## Docker Hub repo

https://hub.docker.com/r/sitkevij/ffmpeg/
