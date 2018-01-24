#!/bin/bash
echo "Finding broken links in '"$1"'"
read -p "Delete Broken Links? [y/N]" deleteLinks

if [ "$deleteLinks" == "y" ] || [ "$deleteLinks" == "Y" ]; then
  #find $1 -type l ! -exec test -e {} \; -print | xargs rm
else 
  find $1 -type l ! -exec test -e {} \; -print
fi
