# ffmpeg snapshot alpine 3.7
## Running
```
docker run --rm sitkevij/ffmpeg:snapshot-alpine
```
## Pulling from Docker Hub
```
docker pull sitkevij/ffmpeg:snapshot-alpine
```
## Building from source
```
git clone https://github.com/sitkevij/ffmpeg.git && \
cd ffmpeg && \
chmod a+x build-local.sh && \
./build-local.sh sitkevij ffmpeg-snapshot-alpine && \
docker run --rm sitkevij/ffmpeg:snapshot-alpine
```
## Buildconf
```
ffmpeg version N-89674-g57d0c24 Copyright (c) 2000-2018 the FFmpeg developers
built with gcc 6.4.0 (Alpine 6.4.0)
configuration: --bindir=/usr/bin --disable-debug --disable-doc --disable-ffplay --enable-avresample --enable-gnutls --enable-gpl --enable-libass --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-librtmp --enable-libtheora --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-nonfree --enable-postproc --enable-small --enable-version3
libavutil      56.  7.100 / 56.  7.100
libavcodec     58.  9.100 / 58.  9.100
libavformat    58.  3.100 / 58.  3.100
libavdevice    58.  0.100 / 58.  0.100
libavfilter     7.  8.100 /  7.  8.100
libavresample   4.  0.  0 /  4.  0.  0
libswscale      5.  0.101 /  5.  0.101
libswresample   3.  0.101 /  3.  0.101
libpostproc    55.  0.100 / 55.  0.100

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
