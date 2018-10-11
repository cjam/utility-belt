#!/bin/bash
SCRIPT_DIR=`dirname $0`
if [ -z $1 ];then
 echo "No Input File specified"
 exit 1
fi

if [ -z $2 ];then
 echo "No Output File specified"
 exit 1
fi
awk -f "$SCRIPT_DIR/awk-gpx-to-ios.awk" $1 > $2

# read -p "Remove Local Branches? (y/N): " ok
# ok=${ok:-n}
# ok=$(echo $ok |awk '{print tolower($0)}')

# #params="-p GIT_REF=chained-build+slack"
# params=""

# if [ "$ok" == "y" ]; then
#     echo "Removing local branches..."
#     git branch | grep -v "master" | xargs git branch -D
# else
#     exit 0
# fi