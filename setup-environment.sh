#!/bin/bash
git config --global user.name "Colter McQuay"
git config --global user.email "colter.mcquay@gmail.com"
git config --global core.editor "code --wait"

echo "Paste the following into your git config:"
echo "
[diff]
    tool = default-difftool
[difftool \"default-difftool\"]
    cmd = code --wait --diff $LOCAL $REMOTE
" 
