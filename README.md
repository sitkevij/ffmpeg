# ffmpeg Docker

[![](https://images.microbadger.com/badges/image/sitkevij/ffmpeg.svg)](https://microbadger.com/images/sitkevij/ffmpeg "image metadata") [![](https://images.microbadger.com/badges/version/sitkevij/ffmpeg.svg)](https://microbadger.com/images/sitkevij/ffmpeg "app version")
[![pulls](https://img.shields.io/docker/pulls/sitkevij/ffmpeg.svg?style=plastic)](https://hub.docker.com/r/sitkevij/ffmpeg/) [![stars](https://img.shields.io/docker/stars/sitkevij/ffmpeg.svg?style=plastic)](https://hub.docker.com/r/sitkevij/ffmpeg/)
[![GitHub Repo stars](https://img.shields.io/github/stars/sitkevij/ffmpeg)](https://github.com/sitkevij/ffmpeg)
[![GitHub repo size](https://img.shields.io/github/repo-size/sitkevij/ffmpeg)](https://github.com/sitkevij/ffmpeg)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/sitkevij/ffmpeg)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/sitkevij/ffmpeg/latest)

## Run

### 1. Pull from Docker Hub

- [ffmpeg-6/ffmpeg-6.1-alpine-3.18](https://github.com/sitkevij/ffmpeg/tree/master/ffmpeg-6/ffmpeg-6.1-alpine-3.18)
  - `docker pull sitkevij/ffmpeg` OR `docker pull sitkevij/ffmpeg:6.1-alpine-3.18`
- [ffmpeg 2.8-ubuntu](https://github.com/sitkevij/ffmpeg/tree/master/ffmpeg-2.8-ubuntu) - default image with nearly all build options enabled, pull command:
  - `docker pull sitkevij/ffmpeg:2.8-ubuntu`
- [ffmpeg 3.3-ubuntu-vmaf](https://github.com/sitkevij/ffmpeg/tree/master/ffmpeg-3.3-ubuntu-vmaf) - ffmpeg 3.3.x with [Netflix VMAF](https://github.com/Netflix/vmaf) compiled and linked, pull command:
  - `docker pull sitkevij/ffmpeg:3.3-vmaf`

### 2. Building from source

```sh
git clone https://github.com/sitkevij/ffmpeg.git && \
cd ffmpeg/ffmpeg-6/ffmpeg-6.1-alpine-3.18 && \
docker build --no-cache -t "sitkevij/ffmpeg:6.1-alpine-3.18" .
```

The default container entry point is `ffmpeg`.

## Running ffprobe

The ffmpeg image includes `ffprobe`, which can be run as:

```sh
docker run --entrypoint "ffprobe" --rm sitkevij/ffmpeg "https://github.com/sitkevij/test-media/blob/master/media/tos-6705k-h264-yuv420p-1920x800-24fps-mp3-44100s.mov?raw=true"
```

## About FFmpeg

- FFmpeg http://ffmpeg.org

## FFmpeg version changelog

Not sure what's in a release? Review the FFmpeg [changelog](https://raw.githubusercontent.com/FFmpeg/FFmpeg/master/Changelog)

## About libs

- libass https://github.com/libass/libass
- libmp3lame http://lame.sourceforge.net
- libopenjpeg http://www.openjpeg.org
- libopus http://opus-codec.org/downloads/
- libvorbis https://xiph.org/vorbis/
- libvpx http://www.linuxfromscratch.org/blfs/view/svn/multimedia/libvpx.html
- x264 https://www.videolan.org/developers/x264.html H.264/AVC encoder
- x265 https://bitbucket.org/multicoreware/x265/wiki/Home x265 HEVC Encoder

## ffmpeg-6.1

```sh
$ docker run -v $(pwd):$(pwd) -w $(pwd) --rm sitkevij/ffmpeg:6.1-alpine318 -buildconf
ffmpeg version 6.1 Copyright (c) 2000-2023 the FFmpeg developers
  built with gcc 12.2.1 (Alpine 12.2.1_git20220924-r10) 20220924
  configuration: --bindir=/usr/bin --disable-debug --disable-doc --disable-ffplay --enable-gnutls --enable-gpl --enable-libaom --enable-libsvtav1 --enable-libass --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-librtmp --enable-libtheora --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-nonfree --enable-postproc --enable-small --enable-version3

  libavutil      58. 29.100 / 58. 29.100
  libavcodec     60. 31.102 / 60. 31.102
  libavformat    60. 16.100 / 60. 16.100
  libavdevice    60.  3.100 / 60.  3.100
  libavfilter     9. 12.100 /  9. 12.100
  libswscale      7.  5.100 /  7.  5.100
  libswresample   4. 12.100 /  4. 12.100
  libpostproc    57.  3.100 / 57.  3.100
  configuration:
    --bindir=/usr/bin
    --disable-debug
    --disable-doc
    --disable-ffplay
    --enable-gnutls
    --enable-gpl
    --enable-libaom
    --enable-libsvtav1
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

## ffmpeg-2.8

```sh
$ docker run sitkevij/ffmpeg -buildconf
ffmpeg version 2.8.11-0ubuntu0.16.04.1 Copyright (c) 2000-2017 the FFmpeg developers
  built with gcc 5.4.0 (Ubuntu 5.4.0-6ubuntu1~16.04.4) 20160609
  configuration: --prefix=/usr --extra-version=0ubuntu0.16.04.1 --build-suffix=-ffmpeg --toolchain=hardened --libdir=/usr/lib/x86_64-linux-gnu --incdir=/usr/include/x86_64-linux-gnu --cc=cc --cxx=g++ --enable-gpl --enable-shared --disable-stripping --disable-decoder=libopenjpeg --disable-decoder=libschroedinger --enable-avresample --enable-avisynth --enable-gnutls --enable-ladspa --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libcdio --enable-libflite --enable-libfontconfig --enable-libfreetype --enable-libfribidi --enable-libgme --enable-libgsm --enable-libmodplug --enable-libmp3lame --enable-libopenjpeg --enable-libopus --enable-libpulse --enable-librtmp --enable-libschroedinger --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libssh --enable-libtheora --enable-libtwolame --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx265 --enable-libxvid --enable-libzvbi --enable-openal --enable-opengl --enable-x11grab --enable-libdc1394 --enable-libiec61883 --enable-libzmq --enable-frei0r --enable-libx264 --enable-libopencv
  libavutil      54. 31.100 / 54. 31.100
  libavcodec     56. 60.100 / 56. 60.100
  libavformat    56. 40.101 / 56. 40.101
  libavdevice    56.  4.100 / 56.  4.100
  libavfilter     5. 40.101 /  5. 40.101
  libavresample   2.  1.  0 /  2.  1.  0
  libswscale      3.  1.101 /  3.  1.101
  libswresample   1.  2.101 /  1.  2.101
  libpostproc    53.  3.100 / 53.  3.100

  configuration:
    --prefix=/usr
    --extra-version=0ubuntu0.16.04.1
    --build-suffix=-ffmpeg
    --toolchain=hardened
    --libdir=/usr/lib/x86_64-linux-gnu
    --incdir=/usr/include/x86_64-linux-gnu
    --cc=cc
    --cxx=g++
    --enable-gpl
    --enable-shared
    --disable-stripping
    --disable-decoder=libopenjpeg
    --disable-decoder=libschroedinger
    --enable-avresample
    --enable-avisynth
    --enable-gnutls
    --enable-ladspa
    --enable-libass
    --enable-libbluray
    --enable-libbs2b
    --enable-libcaca
    --enable-libcdio
    --enable-libflite
    --enable-libfontconfig
    --enable-libfreetype
    --enable-libfribidi
    --enable-libgme
    --enable-libgsm
    --enable-libmodplug
    --enable-libmp3lame
    --enable-libopenjpeg
    --enable-libopus
    --enable-libpulse
    --enable-librtmp
    --enable-libschroedinger
    --enable-libshine
    --enable-libsnappy
    --enable-libsoxr
    --enable-libspeex
    --enable-libssh
    --enable-libtheora
    --enable-libtwolame
    --enable-libvorbis
    --enable-libvpx
    --enable-libwavpack
    --enable-libwebp
    --enable-libx265
    --enable-libxvid
    --enable-libzvbi
    --enable-openal
    --enable-opengl
    --enable-x11grab
    --enable-libdc1394
    --enable-libiec61883
    --enable-libzmq
    --enable-frei0r
    --enable-libx264
    --enable-libopencv
```

## ffmpeg 3.3-vmaf

```sh
$ docker run sitkevij/ffmpeg:3.3-vmaf -buildconf
ffmpeg version N-87201-g837c55e Copyright (c) 2000-2017 the FFmpeg developers
  built with gcc 5.4.0 (Ubuntu 5.4.0-6ubuntu1~16.04.4) 20160609
  configuration: --prefix=/usr/local --extra-cflags=-I/usr/local/include --pkg-config-flags=--static --extra-ldflags=-L/usr/local/lib --bindir=/usr/local/bin --disable-debug --disable-doc --disable-ffplay --enable-avresample --enable-gpl --enable-libfdk_aac --enable-libvmaf --enable-libvpx --enable-libx264 --enable-libx265 --enable-nonfree --enable-postproc --enable-small --enable-version3
  libavutil      55. 74.100 / 55. 74.100
  libavcodec     57.105.100 / 57.105.100
  libavformat    57. 81.100 / 57. 81.100
  libavdevice    57.  8.100 / 57.  8.100
  libavfilter     6.102.100 /  6.102.100
  libavresample   3.  6.  0 /  3.  6.  0
  libswscale      4.  7.103 /  4.  7.103
  libswresample   2.  8.100 /  2.  8.100
  libpostproc    54.  6.100 / 54.  6.100

  configuration:
    --prefix=/usr/local
    --extra-cflags=-I/usr/local/include
    --pkg-config-flags=--static
    --extra-ldflags=-L/usr/local/lib
    --bindir=/usr/local/bin
    --disable-debug
    --disable-doc
    --disable-ffplay
    --enable-avresample
    --enable-gpl
    --enable-libfdk_aac
    --enable-libvmaf
    --enable-libvpx
    --enable-libx264
    --enable-libx265
    --enable-nonfree
    --enable-postproc
    --enable-small
    --enable-version3
```

## Other useful tools

- [hex - hexdumnp utility](https://github.com/sitkevij/hex)
- [mpn - MPEG media inspector](https://github.com/sitkevij/mpn)
