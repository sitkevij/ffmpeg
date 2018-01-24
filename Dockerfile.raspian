FROM resin/rpi-raspbian:stretch
ENV INITSYSTEM on

# ./build-local.sh Dockerfile.raspian sitkevij 3.4.1 "resin/rpi-raspbian" stretch
CMD ["--help"]
ENTRYPOINT ["{{image}}"]
WORKDIR /tmp/{{image}}

LABEL org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.name="{{image}}" \
  org.label-schema.description="{{description}}" \
  org.label-schema.url="https://hub.docker.com/r/{{user}}/{{image}}/" \
  org.label-schema.usage="https://github.com/{{user}}/{{image}}/blob/master/README.md" \
  org.label-schema.vcs-ref="${VCS_REF}" \
  org.label-schema.vcs-url="https://github.com/{{user}}/{{image}}" \
  org.label-schema.vendor="{{user}}" \
  org.label-schema.version="{{version}}" \
  maintainer="https://github.com/{{user}}"

ENV SOFTWARE_VERSION="{{version}}"
ENV SOFTWARE_VERSION_URL="http://ffmpeg.org/releases/ffmpeg-${SOFTWARE_VERSION}.tar.bz2"
ENV BIN="/usr/bin"
ENV SRC="/usr/local"
ENV CPUCOUNT 4

RUN echo "deb http://www.deb-multimedia.org stretch main non-free" >> /etc/apt/sources.list.d/deb-multimedia.list
RUN echo "deb-src http://www.deb-multimedia.org stretch main non-free" >> /etc/apt/sources.list.d/deb-multimedia.list
RUN apt-get update
RUN apt-get install --allow-unauthenticated deb-multimedia-keyring

RUN CPUCOUNT="$(cat /proc/cpuinfo | grep '^processor.*:' | wc -l)" \ 
  && apt-get update \  
  && apt-get -qy install ca-certificates \
  && apt-get upgrade \
  && apt-get install build-essential \
  && apt-get install pkg-config 

RUN apt-get -y install libfdk-aac-dev libx264-dev libmp3lame-dev libass-dev libfreetype6-dev
RUN DIR=$(mktemp -d) && \
cd "${DIR}" && \
curl -Os "${SOFTWARE_VERSION_URL}" && \
tar xjvf "ffmpeg-${SOFTWARE_VERSION}.tar.bz2" && \
cd ffmpeg* && \
PATH="$BIN:$PATH" && \
./configure --arch=armel --target-os=linux --bindir=${BIN} \
  --disable-debug \
  --enable-libfreetype \
  --enable-libass \
  --enable-libmp3lame \
  --enable-libfdk-aac \
  --enable-gpl \
  --enable-nonfree \
  --enable-libx264 \  
  --disable-doc && \
make -j${CPUCOUNT} && \
make install
