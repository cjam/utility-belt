#!/bin/bash


# Modified to work with squash commits
# https://medium.com/opendoor-labs/cleaning-up-branches-with-githubs-squash-merge-43138cc7585e

MAIN_BRANCH="master"

echo "Switching to $MAIN_BRANCH..."
if ! git checkout $MAIN_BRANCH ; then
  echo "Error checking out $MAIN_BRANCH"
  MAIN_BRANCH="main"
  echo "Switching to $MAIN_BRANCH..."
  git checkout $MAIN_BRANCH
fi
echo "Pulling latest from $MAIN_BRANCH..."
git pull origin $MAIN_BRANCH
echo "Deleting orphaned local branches"
comm -12 <(git branch | sed "s/ *//g") <(git remote prune origin | sed "s/^.*origin\///g") | xargs -L1 -J % git branch -D %
