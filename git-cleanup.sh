#!/bin/bash


# Modified to work with squash commits
# https://medium.com/opendoor-labs/cleaning-up-branches-with-githubs-squash-merge-43138cc7585e

echo "Switching to master..."
git checkout master
echo "Pulling latest from mastser..."
git pull origin master
echo "Deleting orphaned local branches"
comm -12 <(git branch | sed "s/ *//g") <(git remote prune origin | sed "s/^.*origin\///g") | xargs -L1 -J % git branch -D %
