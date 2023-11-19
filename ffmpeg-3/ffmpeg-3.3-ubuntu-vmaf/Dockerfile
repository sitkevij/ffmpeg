#
# ffmpeg - http://ffmpeg.org
# Read Ubuntu https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu
# hub https://hub.docker.com/r/sitkevij/ffmpeg/
# docker run --entrypoint "apt-cache" ffmpeg3 rdepends libass-dev
#
FROM        ubuntu:16.04

CMD         ["--help"]
ENTRYPOINT  ["ffmpeg"]
WORKDIR     /tmp/ffmpeg-workdir

ENV     SRC /usr/local
ENV     LD_LIBRARY_PATH ${SRC}/lib
ENV     PKG_CONFIG_PATH ${SRC}/lib/pkgconfig
ENV     BIN ${SRC}/bin

ENV     NASM_VERSION 2.13.01
ENV     FFMPEG_VERSION snapshot
ENV     VPX_VERSION=1.6.1

ENV DEBIAN_FRONTEND noninteractive
# RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN echo ~/ && echo "$HOME"
# RUN apt-get update

RUN BUILD_DEP="autoconf \
    automake \
    cmake \
    curl \
    bzip2 \
    libexpat1-dev \
    g++ \
    gcc \
    git \
    gperf \
    libtool \
    make \
#   nasm \
    perl \
    pkg-config \
    python \
    libssl-dev \
    yasm \
    zlib1g-dev" && \
  export MAKEFLAGS="-j$(($(nproc) + 1))" && \
  apt-get -yqq update && \
  apt-get install -yq --no-install-recommends ${BUILD_DEP} ca-certificates expat libgomp1 

# nasm
RUN cd $SRC && \ 
  curl -Os http://www.nasm.us/pub/nasm/releasebuilds/2.13.01/nasm-$NASM_VERSION.tar.bz2 && \
  tar xjvf nasm-$NASM_VERSION.tar.bz2 && \
  cd nasm-$NASM_VERSION && ./autogen.sh && \
  PATH="$BIN:$PATH" ./configure --prefix="$SRC" --bindir="$BIN" && \ 
  PATH="$BIN:$PATH" make && \ 
  make install

# fdk-aac
RUN DIR=$(mktemp -d) && cd ${DIR} && \
  curl -o fdk-aac.tar.gz https://codeload.github.com/mstorsjo/fdk-aac/legacy.tar.gz/master && \
  tar xzvf fdk-aac.tar.gz && \
  cd mstorsjo-fdk-aac* && \
  autoreconf -fiv && \
  ./configure --prefix="$SRC" --disable-shared && \
  make && \
  make install && \
  rm -rf ${DIR}

# x264
RUN DIR=$(mktemp -d) && cd ${DIR} && \
  curl -Os ftp://ftp.videolan.org/pub/x264/snapshots/last_x264.tar.bz2 && \
  tar xvf last_x264.tar.bz2 &&  \
  cd x264* && \
  ./configure --prefix="$SRC" --bindir="$BIN" --enable-static && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}

# x265 https://bitbucket.org/multicoreware/x265/downloads/x265_2.5.tar.gz
RUN DIR=$(mktemp -d) && cd ${DIR} && \
  curl -Os -L https://bitbucket.org/multicoreware/x265/downloads/x265_2.5.tar.gz && \
  tar xzvf x265_2.5.tar.gz && \
  cd x265*/build/linux && \
  # ./make-Makefiles.bash
  # cmake -G "Unix Makefiles" ../../source && ccmake ../../source
  PATH="$BIN:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$SRC" -DENABLE_SHARED:bool=off ../../source && \
  make && \
  make install && \
  rm -rf ${DIR}

# https://github.com/webmproject/libvpx/archive/v1.6.1.tar.gz
# curl -sL https://codeload.github.com/webmproject/libvpx/tar.gz/v${VPX_VERSION} && \
RUN DIR=$(mktemp -d) && cd ${DIR} && \
  curl -Os -L https://github.com/webmproject/libvpx/archive/v1.6.1.tar.gz && \
  # tar -zx --strip-components=1 && \
  tar xzvf v1.6.1.tar.gz && \
  cd *1.6.1 && \
  ./configure --prefix="$SRC" --enable-vp8 --enable-vp9 --enable-pic --disable-debug --disable-examples --disable-docs --disable-install-bins --enable-shared && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}  

# vmaf - docker run sitkevij/ffmpeg -i mezz -i ref -lavfi libvmaf -f null -
#   note the need for python-tk
RUN apt-get install -y pkg-config gfortran libhdf5-dev libfreetype6-dev liblapack-dev python-pip python-tk && \ 
  python -m pip install --upgrade pip && \ 
  pip install --user numpy scipy matplotlib pandas && \ 
  pip install --upgrade scikit-learn && \ 
  pip install --upgrade h5py && \ 
  echo 'export PATH="$PATH:$HOME/.local/bin"' >>$HOME/.bashrc && \ 
  python -c 'import numpy as pkg; print pkg.__version__; print pkg.__file__'

RUN DIR=$(mktemp -d) && cd ${DIR} && \
  git clone https://github.com/Netflix/vmaf.git && \
  cd vmaf && \
  make && \
  make install && \
  export PYTHONPATH=$SRC/vmaf/python/src:$PYTHONPATH && \
  # execute unittest in a diff container
  # ./unittest && \
  rm -rf ${DIR}

# snapshot http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
RUN DIR=$(mktemp -d) && cd ${DIR} && \
  #curl -Os http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.gz && \
  #tar xzvf ffmpeg-${FFMPEG_VERSION}.tar.gz && \
  curl -Os http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.bz2 && \
  tar xjvf ffmpeg-${FFMPEG_VERSION}.tar.bz2 && \
  # cd ffmpeg-${FFMPEG_VERSION} && \
  cd ffmpeg* && \
  ./configure --prefix="${SRC}" --extra-cflags="-I${SRC}/include" --pkg-config-flags="--static" --extra-ldflags="-L${SRC}/lib" --bindir="${SRC}/bin" \
  --disable-debug \ 
  --disable-doc \
  --disable-ffplay \
  --enable-avresample \ 
  --enable-gpl \
  # --enable-libfaac \
  --enable-libfdk_aac \ 
  # --enable-libmp3lame \
  --enable-libvmaf \ 
  --enable-libvpx \
  --enable-libx264 \ 
  --enable-libx265 \ 
  # --enable-libxvid \
  --enable-nonfree \ 
  --enable-postproc \
  --enable-small \
  --enable-version3 && \
  make && \
  make install && \
  make distclean && \
  hash -r && \
  rm -rf ${DIR}

# cleanup
RUN cd && \
    echo "removing ${BUILD_DEP}" && \
    apt-get purge -y ${BUILD_DEP} && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists && \
    ldconfig && \
    ffmpeg -buildconf
