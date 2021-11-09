#!/bin/bash

# todo: May want to consider inputs at some point
# Vanilla: https://medium.com/introduction-into-bash/bash-scripts-part-3-command-line-options-and-switches-97f1f3a30334
# getopts: https://stackoverflow.com/questions/5474732/how-can-i-add-a-help-method-to-a-shell-script

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

TARGET_BRANCH=${1-master}

echo "Switching to branch $TARGET_BRANCH..."
if ! git checkout -q $TARGET_BRANCH ; then
  echo "Error checking out $TARGET_BRANCH"
fi

echo "Pulling latest from $TARGET_BRANCH..."

# Todo: Paramerterize origin
git pull origin $TARGET_BRANCH

delete_merged_branches () {
    # See: https://github.com/not-an-aardvark/git-delete-squashed
    local TARGET_BRANCH=$1

    git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch
    do 
        local mergeBase=$(git merge-base $TARGET_BRANCH $branch)
        if [[ $(git cherry $TARGET_BRANCH $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] ; then
            # TODO: add --dry-run parameter and log instead
            # echo "$branch is merged into $TARGET_BRANCH and can be deleted"
            git branch -D $branch
        fi
    done
}

delete_merged_branches $TARGET_BRANCH

# git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch
# do 
#     delete_branch_if_merged $branch
# done

# echo "Deleting orphaned local branches"∂
# if [ "$machine" == "Mac" ];then
#     comm -12 <(git branch | sed "s/ *//g") <(git remote prune origin | sed "s/^.*origin\///g") | xargs -L1 -J % git branch -D %
# elif [ "$machine" == "Linux" ];then
#     comm -12 --nocheck-order <(git branch | sed "s/ *//g") <(git remote prune origin | awk "NR>2" |  sed "s/^.*origin\///g") | xargs -L1 -I % sh -c 'git branch -D %'
# fi
