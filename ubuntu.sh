#!/bin/bash

command -v fish >/dev/null 2>&1 && echo "fish shell already installed" || { echo "Installing fish shell"; apt-add-repository ppa:fish-shell/release-3; apt update; apt install fish; }
# Check if distro is Ubuntu or another OS
# TODO: Download code editor and other essential apps

# create custom bin folder at user's home
if [[ ! -d $HOME/bin ]]; then
  mkdir $HOME/bin
fi

# install yarn
curl -o- -L https://yarnpkg.com/install.sh | bash

# TODO: Find better way

if [[ ! -f diff-so-fancy ]]; then
  # install diff-so-fancy
  cd $HOME/bin
  curl -o- -L https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy > diff-so-fancy
  chmod +x $HOME/bin/*
  cd -
fi
