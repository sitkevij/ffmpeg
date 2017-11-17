#
# ffmpeg - http://ffmpeg.org/
# Read Ubuntu https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu
# hub https://hub.docker.com/r/sitkevij/ffmpeg/
#
FROM        ubuntu:16.04

CMD         ["--help"]
ENTRYPOINT  ["ffmpeg"]
WORKDIR     /tmp/ffmpeg-workdir

RUN apt-get update && apt-get install ffmpeg -y
