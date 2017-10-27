set -ex
# docker hub username
USERNAME=$1
VERSION=$2
echo $1
echo $2
# image name
IMAGE=ffmpeg
docker build --no-cache -t $USERNAME/$IMAGE:latest -t $USERNAME/$IMAGE:$VERSION $VERSION
echo "# ffmpeg $VERSION" >$VERSION/README.md
echo "\`\`\`" >>$VERSION/README.md
docker run --rm $USERNAME/$IMAGE -version >>$VERSION/README.md
docker run --rm $USERNAME/$IMAGE -buildconf >>$VERSION/README.md
echo "\`\`\`" >>$VERSION/README.md
