#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# Modified to work with squash commits
# https://medium.com/opendoor-labs/cleaning-up-branches-with-githubs-squash-merge-43138cc7585e

MAIN_BRANCH=${1-master}

echo "Switching to branch $MAIN_BRANCH..."
if ! git checkout $MAIN_BRANCH ; then
  echo "Error checking out $MAIN_BRANCH"
fi

echo "Pulling latest from $MAIN_BRANCH..."

# Todo: Paramerterize origin
git pull origin $MAIN_BRANCH
echo "Deleting orphaned local branches"
if [ "$machine" == "Mac" ];then
    comm -12 <(git branch | sed "s/ *//g") <(git remote prune origin | sed "s/^.*origin\///g") | xargs -L1 -J % git branch -D %
elif [ "$machine" == "Linux" ];then
    comm -12 --nocheck-order <(git branch | sed "s/ *//g") <(git remote prune origin | awk "NR>2" |  sed "s/^.*origin\///g") | xargs -L1 -I % sh -c 'git branch -D %'
fi
