# ffmpeg 3.3 alpine 3.7
## Running
```
docker run --rm sitkevij/ffmpeg:3.3-alpine
```
## Pulling from Docker Hub
```
docker pull sitkevij/ffmpeg:3.3-alpine
```
## Building from source
```
git clone https://github.com/sitkevij/ffmpeg.git && \
cd ffmpeg && \
chmod a+x build-local.sh && \
./build-local.sh sitkevij ffmpeg-3.3-alpine && \
docker run --rm sitkevij/ffmpeg:3.3-alpine
```
## Buildconf
```
ffmpeg version 3.3 Copyright (c) 2000-2017 the FFmpeg developers
built with gcc 6.4.0 (Alpine 6.4.0)
configuration: --bindir=/usr/bin --disable-debug --disable-doc --disable-ffplay --enable-avresample --enable-gnutls --enable-gpl --enable-libass --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-librtmp --enable-libtheora --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-nonfree --enable-postproc --enable-small --enable-version3
libavutil      55. 58.100 / 55. 58.100
libavcodec     57. 89.100 / 57. 89.100
libavformat    57. 71.100 / 57. 71.100
libavdevice    57.  6.100 / 57.  6.100
libavfilter     6. 82.100 /  6. 82.100
libavresample   3.  5.  0 /  3.  5.  0
libswscale      4.  6.100 /  4.  6.100
libswresample   2.  7.100 /  2.  7.100
libpostproc    54.  5.100 / 54.  5.100

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
