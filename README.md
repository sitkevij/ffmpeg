## ffmpeg Docker

There are two ways to run ffmpeg Docker images:

# 1. Pull from Docker Hub

- [ffmpeg 3.3-alpine/latest](https://github.com/sitkevij/ffmpeg/tree/master/3.3-alpine)
  - `docker pull sitkevij/ffmpeg` OR `docker pull sitkevij/ffmpeg:3.3-alpine`
- [ffmpeg 2.8-ubuntu](https://github.com/sitkevij/ffmpeg/tree/master/2.8-ubuntu) - default image with nearly all build options enabled, pull command:
  - `docker pull sitkevij/ffmpeg:2.8-ubuntu`
- [ffmpeg 3.3-ubuntu-vmaf](https://github.com/sitkevij/ffmpeg/tree/master/3.3-ubuntu-vmaf) - ffmpeg 3.3.x with [Netflix VMAF](https://github.com/Netflix/vmaf) compiled and linked, pull command:
  - `docker pull sitkevij/ffmpeg:3.3-vmaf`

# 2. Building from source
```
$ git clone https://github.com/sitkevij/ffmpeg.git && \
cd ffmpeg && \
chmod a+x build-local.sh && \
./build-local.sh sitkevij 3.3-alpine && \
docker run --rm sitkevij/ffmpeg:3.3-alpine
```

The default container entry point is `ffmpeg`. 

# Running ffprobe
The ffmpeg image includes `ffprobe`, which can be run as:
```
$ docker run --entrypoint "ffprobe" --rm sitkevij/ffmpeg:3.3-alpine "https://github.com/sitkevij/test-media/blob/master/media/tos-6705k-h264-yuv420p-1920x800-24fps-mp3-44100s.mov?raw=true"
```

[![build](https://travis-ci.org/sitkevij/ffmpeg.svg?branch=master)](https://travis-ci.org/sitkevij/ffmpeg) [![pulls](https://img.shields.io/docker/pulls/sitkevij/ffmpeg.svg?style=plastic)](https://hub.docker.com/r/sitkevij/ffmpeg/) [![stars](https://img.shields.io/docker/stars/sitkevij/ffmpeg.svg?style=plastic)](https://hub.docker.com/r/sitkevij/ffmpeg/)

# About FFmpeg

- FFmpeg http://ffmpeg.org

# About libs

- libass https://github.com/libass/libass
- libmp3lame http://lame.sourceforge.net
- libopenjpeg http://www.openjpeg.org
- libopus http://opus-codec.org/downloads/
- libvorbis https://xiph.org/vorbis/
- libvpx http://www.linuxfromscratch.org/blfs/view/svn/multimedia/libvpx.html
- x264 https://www.videolan.org/developers/x264.html H.264/AVC encoder
- x265 https://bitbucket.org/multicoreware/x265/wiki/Home x265 HEVC Encoder

# ffmpeg-2.8

```
docker run sitkevij/ffmpeg -buildconf
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

# ffmpeg 3.3-vmaf

```
docker run sitkevij/ffmpeg:3.3-vmaf -buildconf
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


