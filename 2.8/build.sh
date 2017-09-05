set -ex
# docker hub username
USERNAME=sitkevij
# image name
IMAGE=ffmpeg
docker build -t $USERNAME/$IMAGE:latest .
