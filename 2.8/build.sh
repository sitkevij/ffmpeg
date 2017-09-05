set -ex
# docker hub username
USERNAME=$1
echo $1
# image name
IMAGE=ffmpeg
docker build -t $USERNAME/$IMAGE:latest .
