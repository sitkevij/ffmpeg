#!/bin/sh
DOCKERFILE_TEMPLATE="$1"
USERNAME="$2"
VERSION="$3"
FROM="$4"
IMAGE="ffmpeg"
cat $DOCKERFILE_TEMPLATE | sed "s/{{from}}/$FROM/" | sed "s/{{image}}/$IMAGE/" | sed "s/{{user}}/$USERNAME/" | sed "s/{{version}}/$VERSION/" | sed 's/{{description}}/Small ffmpeg Docker images for Alpine Linux, Ubuntu with VMAF option/'
