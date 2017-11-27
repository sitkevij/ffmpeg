#!/bin/sh
set -ex
# https://raw.githubusercontent.com/
# https://github.com/sitkevij/test-media/blob/master/media/${FILE}?raw=true
# tos-6705k-h264-yuv420p-1920x800-24fps-mp3-44100s.mov
FILE="$1"
curl -o "${FILE}" "https://raw.githubusercontent.com/sitkevij/test-media/master/media/${FILE}"
docker run --rm -v=`pwd`:/tmp/ffmpeg sitkevij/ffmpeg -y \
 -i "${FILE}" \
 -codec copy \
 -bsf:v h264_mp4toannexb \
 -force_key_frames 'expr:gte(t,n_forced*2)' \
 -map 0 \
 -f segment \
 -segment_time 10 \
 -segment_format mpegts \
 -segment_list "${FILE}-prog_index.m3u8" \
 -segment_list_type m3u8 \
 "${FILE}-seq%03d.ts" 
