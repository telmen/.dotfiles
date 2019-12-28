#!/bin/bash

function install_fisher() {
  command -v fisher >/dev/null 2>&1 && { echo >&2 "fisher already installed"; return; }
  command -v fish >/dev/null 2>&1 || { echo >&2 "fish shell not installed"; return; }
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
  fisher
  . ~/.config/fish/config.fish
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  . $(pwd -P)/brew.sh
  . $(pwd -P)/macos.sh
elif  [[ "$OSTYPE" == "linux"* ]]; then
  . $(pwd -P)/ubuntu.sh
fi
. $(pwd -P)/sync.sh

# FIXME: This is not working
# install n - node version manager
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
sudo bash n lts
# set fish as default shell
chsh -s $(which fish)
install_fisher
echo "fish shell installed"
fish

