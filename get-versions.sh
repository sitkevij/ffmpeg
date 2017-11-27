#!/bin/sh
curl -s http://ffmpeg.org/releases/ |  cut -f4 -d= | cut -f2 -d\" | grep "bz2$" | grep "\-3.[3,4,5,6,7]" | tail -4 
