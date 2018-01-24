#!/bin/sh
set -ex
# docker hub username
DOCKERFILE="$1"
USERNAME="$2"
VERSION="$3"
IMAGE="ffmpeg"
OS="$4"
OS_SAFE=$(echo $OS | sed -e "s/\//-/g") # in case of base/image such as arm32v6/alpine
echo $OS
OS_VERSION="$5"
LOCAL_DIR="${IMAGE}-${VERSION}-${OS_SAFE}"
if [ ! -d "$LOCAL_DIR" ]; then
    mkdir $LOCAL_DIR
fi
README="${LOCAL_DIR}/README.md"
./gen-dockerfile.sh "$DOCKERFILE" "$USERNAME" "$VERSION" "$OS_SAFE:$OS_VERSION" >"$LOCAL_DIR/Dockerfile"
docker build --no-cache -t "$USERNAME/$IMAGE:latest" -t "$USERNAME/$IMAGE:$VERSION-$OS_SAFE" "$LOCAL_DIR"
echo "# ${IMAGE} ${VERSION} ${OS} ${OS_VERSION}" >"${README}"
echo "## Running" >>"${README}"
echo "\`\`\`" >>"${README}"
echo "docker run --rm sitkevij/${IMAGE}:${VERSION}-${OS_SAFE}" >>"${README}"
echo "\`\`\`" >>"${README}"
echo "## Pulling from Docker Hub" >>"${README}"
echo "\`\`\`" >>"${README}"
echo "docker pull sitkevij/${IMAGE}:${VERSION}-${OS_SAFE}" >>"${README}"
echo "\`\`\`" >>"${README}"
echo "## Building from source" >>"${README}"
echo "\`\`\`" >>"${README}"
echo "git clone https://github.com/sitkevij/ffmpeg.git && \\" >>"${README}"
echo "cd ffmpeg && \\" >>"${README}"
echo "chmod a+x build-local.sh && \\" >>"${README}"
echo "./build-local.sh sitkevij ${LOCAL_DIR} && \\" >>"${README}"
echo "docker run --rm sitkevij/${IMAGE}:${VERSION}-${OS_SAFE}" >>"${README}"
echo "\`\`\`" >>"${README}"
echo "## Buildconf" >>"${README}"
echo "\`\`\`" >>"${README}"
docker run --rm "$USERNAME/$IMAGE:$VERSION-$OS_SAFE" -version >>"${README}"
docker run --rm "$USERNAME/$IMAGE:$VERSION-$OS_SAFE" -buildconf >>"${README}"
echo "\`\`\`" >>"${README}"
echo "## Git repo" >>"${README}"
echo "https://github.com/${USERNAME}/${IMAGE}" >>"${README}"
echo "## Docker Hub repo" >>"${README}"
echo "https://hub.docker.com/r/${USERNAME}/${IMAGE}/" >>"${README}"
# see https://stackoverflow.com/questions/23137336/search-and-replace-with-bash
