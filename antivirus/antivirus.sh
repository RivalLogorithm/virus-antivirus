#!/bin/bash

my_name=${0##*/}
scan_folder=$1
virus_code=$(cat "$(find ${0%/*} -name 'virus_code.txt' -type f)")

if [ -n "$scan_folder" ];
then
  cd $scan_folder
fi

get_sh_files=$(find \( -name '*.sh' \) -not \( -name 'antivirus.sh' -type f \))

for f in $get_sh_files; do
  if [ "$my_name" != "$f" ];
  then
    virus_strings="$(cat "$f" | grep -o "$virus_code")"
    if [ -n "$virus_strings" ];
    then
      echo "$f Infected"
    fi
  fi
done