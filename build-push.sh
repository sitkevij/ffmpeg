#!/bin/sh
set -ex

BRANCH_PUSH="travis-build"
GIT_PROJECT="ffmpeg"
GIT_USER="sitkevij"

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git checkout -b $BRANCH_PUSH
  git add --all
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin "https://${GH_TOKEN}@github.com/${GIT_USER}/${GIT_PROJECT}.git" > /dev/null 2>&1
  git push --quiet --set-upstream origin $BRANCH_PUSH
}

setup_git
commit_website_files
upload_files
