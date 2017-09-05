set -ex
# docker hub username
USERNAME=$1
echo $USERNAME
# image name
IMAGE=ffmpeg
# ensure we're up to date
git pull
# bump version
# docker run --rm -v "$PWD":/app sitkevij/bump patch
version=`cat VERSION`
echo "version: $version"
username=`git config user.name`
echo "git user.name $username"
# run build
./build.sh
# tag it
git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
git push --tags
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version
# push it
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version

