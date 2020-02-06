#!/bin/bash

function install_fisher() {
  if command -v fisher >/dev/null 2>&1; then
    echo >&2 "fisher already installed"
    return
  fi
  if ! command -v fish >/dev/null 2>&1; then
    echo >&2 "fish not installed"
    return
  fi
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
  fish
  fisher
  . ~/.config/fish/config.fish
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  . $(pwd -P)/brew.sh
  . $(pwd -P)/macos.sh
elif [[ "$OSTYPE" == "linux"* ]]; then
  . $(pwd -P)/ubuntu.sh
fi
. $(pwd -P)/common.sh
. $(pwd -P)/sync.sh

# install n - node version manager
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
bash n lts
[[ -f n ]] && rm -rf n
# set fish as default shell
echo "setting fish as default shell"
chsh -s $(which fish)
install_fisher
echo "now close current session and open new one."
