# ffmpeg 3.4.1 resin/rpi-raspbian stretch
## Running
```
docker run --rm sitkevij/ffmpeg:3.4.1-resin-rpi-raspbian
```
## Pulling from Docker Hub
```
docker pull sitkevij/ffmpeg:3.4.1-resin-rpi-raspbian
```
## Building from source
```
git clone https://github.com/sitkevij/ffmpeg.git && \
cd ffmpeg && \
chmod a+x build-local.sh && \
./build-local.sh sitkevij ffmpeg-3.4.1-resin-rpi-raspbian && \
docker run --rm sitkevij/ffmpeg:3.4.1-resin-rpi-raspbian
```
## Buildconf
```
ffmpeg version 3.4.1 Copyright (c) 2000-2017 the FFmpeg developers
built with gcc 6.3.0 (Raspbian 6.3.0-18+rpi1) 20170516
configuration: --arch=armel --target-os=linux --bindir=/usr/bin --disable-debug --enable-libfreetype --enable-libass --enable-libmp3lame --enable-libfdk-aac --enable-gpl --enable-nonfree --enable-libx264 --disable-doc
libavutil      55. 78.100 / 55. 78.100
libavcodec     57.107.100 / 57.107.100
libavformat    57. 83.100 / 57. 83.100
libavdevice    57. 10.100 / 57. 10.100
libavfilter     6.107.100 /  6.107.100
libswscale      4.  8.100 /  4.  8.100
libswresample   2.  9.100 /  2.  9.100
libpostproc    54.  7.100 / 54.  7.100

  configuration:
    --arch=armel
    --target-os=linux
    --bindir=/usr/bin
    --disable-debug
    --enable-libfreetype
    --enable-libass
    --enable-libmp3lame
    --enable-libfdk-aac
    --enable-gpl
    --enable-nonfree
    --enable-libx264
    --disable-doc
```
## Git repo
https://github.com/sitkevij/ffmpeg
## Docker Hub repo
https://hub.docker.com/r/sitkevij/ffmpeg/
