#
# ffmpeg - http://ffmpeg.org/
# Read Ubuntu https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu
# hub https://hub.docker.com/r/sitkevij/ffmpeg/
# docker run --entrypoint "apt-cache" ffmpeg3 rdepends libass-dev
#
FROM        ubuntu:16.04
# FROM        debian:stretch
# see https://hub.docker.com/r/blitznote/debootstrap-amd64/
# FROM        blitznote/debootstrap-amd64:16.04 

CMD         ["--help"]
ENTRYPOINT  ["ffmpeg"]
WORKDIR     /tmp/ffmpeg-workdir

ENV SRC=/usr/local \
    LD_LIBRARY_PATH=${SRC}/lib \  
    PKG_CONFIG_PATH=${SRC}/lib/pkgconfig \
    BIN=${SRC}/bin \
    NASM_VERSION=2.13.01 \
    FFMPEG_VERSION=snapshot \ 
    VPX_VERSION=1.6.1 \
    LIBASS_VERSION=0.13.7 \ 
    GET="curl -Os -L" \
    DEBIAN_FRONTEND=noninteractive 

RUN BUILD_DEP="autoconf \
    automake \
    cmake \
    curl \
    bzip2 \
    libexpat1-dev \
    g++ \
    gcc \
    gperf \
    libtool \
    make \
   # perl \
    pkg-config \
   # python \
    libssl-dev \
    yasm \
    zlib1g-dev" && \
  export MAKEFLAGS="-j$(($(nproc) + 1))" && \
  apt-get -yqq update && \
  apt-get install -yq --no-install-recommends ${BUILD_DEP} ca-certificates expat libgomp1 

ENV   CD='cd(){ builtin cd "${@:1:1}"; }; cd '

# nasm
RUN cd $SRC && \ 
  $GET http://www.nasm.us/pub/nasm/releasebuilds/2.13.01/nasm-$NASM_VERSION.tar.bz2 && \
  tar xjvf nasm-$NASM_VERSION.tar.bz2 && \
  cd nasm-$NASM_VERSION && ./autogen.sh && \
  PATH="$BIN:$PATH" ./configure --prefix="$SRC" --bindir="$BIN" && \ 
  PATH="$BIN:$PATH" make && \ 
  make install 

# freebidi
RUN DIR=$(mktemp -d) && cd ${DIR} && \
  $GET https://www.fribidi.org/download/fribidi-0.19.7.tar.bz2 && \
  tar xvf fribidi-0.19.7.tar.bz2 &&  \
  cd fribidi-0.19.7 && \
  ./configure --prefix="$SRC" && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}

# freetype --without-harfbuzz
RUN DIR=$(mktemp -d) && cd ${DIR} && \
  $GET https://downloads.sourceforge.net/freetype/freetype-2.8.tar.bz2 && \
  tar xvf freetype-2.8.tar.bz2 &&  \
  cd freetype* && \
  sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg && \
  sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
    -i include/freetype/config/ftoption.h  && \
  ./configure --prefix="$SRC" && \ 
  make && \
  make install && \
  # make distclean && \
  rm -rf ${DIR}

# fontconfig
#RUN DIR=$(mktemp -d) && cd ${DIR} && \
#  $GET https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.4.tar.bz2 &&  \
#  tar xvf fontconfig-2.12.4.tar.bz2 &&  \
#  cd fontconfig* && \
#  rm -f src/fcobjshash.h && \
#  ./configure --prefix="$SRC" --sysconfdir=/etc --localstatedir=/var \
#            --disable-docs       \
#            --docdir=/usr/share/doc/fontconfig-2.12.4 && \
#  make && \
#  make install && \
#  make distclean && \
#  rm -rf ${DIR}

# libass http://www.linuxfromscratch.org/blfs/view/svn/multimedia/libass.html
# https://github.com/libass/libass/releases/download/0.13.7/libass-0.13.7.tar.xz
RUN DIR=$(mktemp -d) && cd ${DIR} && \
  $GET https://github.com/libass/libass/releases/download/0.13.7/libass-$LIBASS_VERSION.tar.gz && \
  tar xzvf libass-$LIBASS_VERSION.tar.gz && \
  cd libass* && \
  ./configure --prefix="$SRC" --disable-require-system-font-provider && \
  make && \
  make install && \
  rm -rf ${DIR}

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
  curl -Os -L ftp://ftp.videolan.org/pub/x264/snapshots/last_x264.tar.bz2 && \
  tar xvf last_x264.tar.bz2 &&  \
  cd x264* && \
  ./configure --prefix="$SRC" --bindir="$BIN" --enable-static && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}

# x265 https://bitbucket.org/multicoreware/x265/downloads/x265_2.5.tar.gz
RUN DIR=$(mktemp -d) && cd ${DIR} && \
  $GET https://bitbucket.org/multicoreware/x265/downloads/x265_2.5.tar.gz && \
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
  $GET https://github.com/webmproject/libvpx/archive/v1.6.1.tar.gz && \
  # tar -zx --strip-components=1 && \
  tar xzvf v1.6.1.tar.gz && \
  cd *1.6.1 && \
  ./configure --prefix="$SRC" --enable-vp8 --enable-vp9 --enable-pic --disable-debug --disable-examples --disable-docs --disable-install-bins --enable-shared && \
  make && \
  make install && \
  make distclean && \
  rm -rf ${DIR}  

# snapshot http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2
RUN DIR=$(mktemp -d) && cd ${DIR} && \
  $GET http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.bz2 && \
  tar xjvf ffmpeg-${FFMPEG_VERSION}.tar.bz2 && \
  cd ffmpeg* && \
  ./configure --prefix="${SRC}" --extra-cflags="-I${SRC}/include" --pkg-config-flags="--static" --extra-ldflags="-L${SRC}/lib" --bindir="${SRC}/bin" \
  --disable-debug \ 
  --disable-doc \
  --disable-ffplay \
  --enable-avresample \ 
  --enable-gpl \
  --enable-libass \ 
  # --enable-libfaac \
  --enable-libfdk_aac \ 
  # --enable-libmp3lame \
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
