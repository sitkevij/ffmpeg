#!/bin/sh
DOCKERFILE_TEMPLATE="$1"
USERNAME="$2"
VERSION="$3"
FROM="$4"
IMAGE="ffmpeg"
OS="alpine"
OS_SAFE=$(echo $OS | sed -e "s/\//-/g") # in case of base/image such as arm32v6/alpine
OS_VERSION="3.7"
LOCAL_DIR="${IMAGE}-${VERSION}-${OS_SAFE}"
README="${LOCAL_DIR}/README.md"
cat $DOCKERFILE_TEMPLATE | sed "s/{{from}}/$FROM/" | sed "s/{{image}}/$IMAGE/" | sed "s/{{user}}/$USERNAME/" | sed "s/{{version}}/$VERSION/" | sed 's/{{description}}/Small ffmpeg Docker images for Alpine Linux, Ubuntu with VMAF option/'
