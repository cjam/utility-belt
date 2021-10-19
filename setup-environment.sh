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

brew install bash-completion
# [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Install Node and n and reinstall npm to fix after n
brew install node
npm install -g n

# Install Node 10
sudo n 10
# Install and use latest Node
sudo n latest

# Reinstall npm to fix global installs
curl -0 -L https://npmjs.com/install.sh | sudo sh

# brew install yarn --without-node

# Right now need to install specific yarn version
brew install https://raw.githubusercontent.com/chenrui333/homebrew-core/278b3f8eb59653907b0b8ed4b3bd6e0c954a9b1f/Formula/yarn.rb


# Install global packages
npm install -g react-native-cli

sudo gem install cocoapods

# Install Workflows
cp -rf "./Call Number.workflow" ~/Library/Services/






