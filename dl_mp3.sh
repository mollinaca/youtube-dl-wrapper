#!/bin/bash

type youtube-dl >/dev/null 2>&1
retval=$?
if [[ $retval -ne 0 ]]
then
  echo "require youtube-dl" >&2
  exit $retval
fi

type ffmpeg >/dev/null 2>&1
retval=$?
if [[ $retval -ne 0 ]]
then
  echo "require ffmpeg" >&2
  exit $retval
fi

url=$1
rm -f dl.*
youtube-dl "${url}" -x -f "bestaudio" --audio-format mp3 --audio-quality 1 -o 'dl.%(ext)s'
