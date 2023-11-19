# ffmpeg 6.0 alpine 3.18

## Running

```sh
docker run --rm sitkevij/ffmpeg:6.0-alpine-3.18
```

## Generate Test Video

```sh
docker run -v $(pwd):$(pwd) -w $(pwd) --rm sitkevij/ffmpeg:6.0-alpine-3.18 -y -c:v libsvtav1 -y -filter_complex "smptehdbars=s=1280x720:rate=30:d=4,scale='-1:min(ih,1080)',pad=1920:1080:(ow-iw)/2:(oh-ih)/2,setsar=1,format=yuv420p[v]" -map '[v]' smptehdbars_1280x720_4s_30fps_yuv420p.mp4
```

## Using ffprobe

```sh
docker run --entrypoint "ffprobe" --rm sitkevij/ffmpeg:6.0-alpine-3.18 "https://github.com/sitkevij/test-media/blob/master/media/tos-6705k-h264-yuv420p-1920x800-24fps-mp3-44100s.mov?raw=true"
```

## Pulling from Docker Hub

```sh
docker pull sitkevij/ffmpeg:6.0-alpine-3.18
```

## Building from source

```sh
git clone https://github.com/sitkevij/ffmpeg.git && \
cd ffmpeg/ffmpeg-6/ffmpeg-6.0-alpine-3.18 && \
docker build --no-cache -t "sitkevij/ffmpeg:6.0-alpine-3.18" .
```

## Buildconf

```sh
$ docker run -v $(pwd):$(pwd) -w $(pwd) --rm sitkevij/ffmpeg:6.0-alpine-3.18 -buildconf

ffmpeg version 6.0 Copyright (c) 2000-2023 the FFmpeg developers
  built with gcc 12.2.1 (Alpine 12.2.1_git20220924-r10) 20220924
  configuration: --bindir=/usr/bin --disable-debug --disable-doc --disable-ffplay --enable-gnutls --enable-gpl --enable-libaom --enable-libsvtav1 --enable-libass --enable-libfreetype --enable-libmp3lame --enable-libopus --enable-librtmp --enable-libtheora --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-nonfree --enable-postproc --enable-small --enable-version3
  libavutil      58.  2.100 / 58.  2.100
  libavcodec     60.  3.100 / 60.  3.100
  libavformat    60.  3.100 / 60.  3.100
  libavdevice    60.  1.100 / 60.  1.100
  libavfilter     9.  3.100 /  9.  3.100
  libswscale      7.  1.100 /  7.  1.100
  libswresample   4. 10.100 /  4. 10.100
  libpostproc    57.  1.100 / 57.  1.100

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
    --enable-version3                                                                                                                                                                            [20:58:30]
```

## Git repo

https://github.com/sitkevij/ffmpeg

## Docker Hub repo

https://hub.docker.com/r/sitkevij/ffmpeg/
