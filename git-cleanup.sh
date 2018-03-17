#!/bin/bash


echo "Pruning remote branches..."
git remote prune origin
echo "Pulling latest from mastser..."
git pull origin master
echo "Removing merged local branches..."
git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d


