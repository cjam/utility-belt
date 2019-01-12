#!/bin/bash

echo "Installing Brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


## Install and Configure Git

brew install git

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


# Install Node and n and reinstall npm to fix after n
brew install node
npm install -g n

# Install Node 10
n 10
# Install and use latest Node
n latest

# Reinstall npm to fix global installs
curl -0 -L https://npmjs.com/install.sh | sudo sh

# Install global packages
npm install -g react-native-cli









