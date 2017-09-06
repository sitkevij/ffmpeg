set -ex
# docker hub username
USERNAME=$1
VERSION=$2
echo $1
echo $2
# image name
IMAGE=ffmpeg
docker build -t $USERNAME/$IMAGE:latest -t $USERNAME/$IMAGE:$VERSION $VERSION
