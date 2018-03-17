#!/bin/bash
dir=$1
if [ "$dir" == "" ]; then
  dir="."
fi

echo "Finding broken links in '"$dir"'"

read -p "Delete Broken Links? [y/N]" deleteLinks

if [ "$deleteLinks" == "y" ] || [ "$deleteLinks" == "Y" ]; then
  find $dir -type l ! -exec test -e {} \; -print | xargs rm
else 
  find $dir -type l ! -exec test -e {} \; -print
fi
