#!/bin/sh
set -ex
# https://raw.githubusercontent.com/
# https://github.com/sitkevij/test-media/blob/master/media/${FILE}?raw=true
# tos-6705k-h264-yuv420p-1920x800-24fps-mp3-44100s.mov
# refer https://wideopenbokeh.com/AthenasFall/?p=111
# ProRes https://www.apple.com/final-cut-pro/docs/Apple_ProRes_White_Paper.pdf
IMAGE="$1"
FILE="$2"
if [ -f "${FILE}" ]
then
    echo "${FILE} found, using."
else
    echo "${FILE} not found, requesting..."
    curl -o "${FILE}" "https://raw.githubusercontent.com/sitkevij/test-media/master/media/${FILE}"
fi

SUBTITLES_EN="TOS-en.srt" 
curl -o "${SUBTITLES_EN}" "https://download.blender.org/demo/movies/ToS/subtitles/TOS-en.srt"

# force 29.97 NTSC
docker run --rm -v=`pwd`:/tmp/ffmpeg "${IMAGE}" -y \
 -r ntsc \
 -i "${FILE}" \
 "${FILE}.ntsc.mov"

# 420p
docker run --rm -v=`pwd`:/tmp/ffmpeg "${IMAGE}" -y \
 -i "${FILE}" \
 "${FILE}.yuv" 

# yuv422p10le / prores (apch / 0x68637061)
#0 ProRes422 (Proxy) – apco
#1 ProRes422 (LT) – apcs
#2 ProRes422 (Normal) – apcn
#3 ProRes422 (HQ)- apch
docker run --rm -v=`pwd`:/tmp/ffmpeg "${IMAGE}" -y \
 -i "${FILE}" \
 -c:v prores -profile:v 3 \
 "${FILE}.prores.mov"

# subtitles
 docker run --rm -v=`pwd`:/tmp/ffmpeg "${IMAGE}" -y \
 -i "${FILE}" \
 -vf subtitles=${SUBTITLES_EN} \
 "${FILE}.srt.mov"

# prores_ks default
docker run --rm -v=`pwd`:/tmp/ffmpeg "${IMAGE}" -y \
 -i "${FILE}" \
 -c:v prores_ks -profile:v 3 \
 "${FILE}.prores_ks3.mov"

# prores_ks yuv444p10 - 5th profile
docker run --rm -v=`pwd`:/tmp/ffmpeg "${IMAGE}" -y \
 -i "${FILE}" \
 -c:v prores_ks -profile:v 4 \
 -pix_fmt yuv444p10 \
 "${FILE}.prores_ks4.mov"

# docker run --rm -v=`pwd`:/tmp/ffmpeg sitkevij/vmaf run_vmaf yuv420p 1920 800 tos-6705k-h264-yuv420p-1920x800-24fps-mp3-44100s.mov.yuv tos-6705k-h264-yuv420p-1920x800-24fps-mp3-44100s.mov.prores.mov

