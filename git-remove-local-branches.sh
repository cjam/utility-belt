#!/bin/bash
read -p "Remove Local Branches? (y/N): " ok
ok=${ok:-n}
ok=$(echo $ok |awk '{print tolower($0)}')

#params="-p GIT_REF=chained-build+slack"
params=""

if [ "$ok" == "y" ]; then
    echo "Removing local branches..."
    git branch | grep -v "master" | xargs git branch -D
else
    exit 0
fi