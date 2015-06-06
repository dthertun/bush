#!/bin/bash
oocalc_complete() {
local ext="ods"
local word="$2"
# Standard completion (filename-completion)
local i=0 line
declare -a list
while read line; do
list[i++]="$line"
done < <(compgen -f -- "$word")

# Filter: only filenames with the correct extension
local w e
for w in "${list[@]}"; do
if [ -d "$w" ]; then
    continue
      else
         e="${w##*.}"
        if [ "$e" = "$ext" ]; then
         COMPREPLY[i++]="$w"
        fi
        fi
      done
  }

 complete -o plusdirs -F oocalc_complete oocalc
