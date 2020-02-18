#!/bin/bash

function install_fisher() {
  if command -v fisher >/dev/null 2>&1; then
    echo >&2 "fisher already installed"
    return
  fi
  if ! command -v fish >/dev/null 2>&1; then
    echo >&2 "fish not installed"
    exit 1
  fi
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
  fish
  fisher
  . ~/.config/fish/config.fish
}

# only macOS specific installs
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo -e "\\n\\nRunning on macOS"

  if test ! "$(command -v brew)"; then
    echo "Installing homebrew"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
  fi

  . $(pwd -P)/brew.sh

  echo -e "\\n\\nRunning fzf install script..."
  echo "============================"
  /usr/local/opt/fzf/install --all --no-bash --no-zsh

  . $(pwd -P)/macos.sh
elif [[ "$OSTYPE" == "linux"* ]]; then
  echo -e "\\n\\nRunning on Linux"
  . $(pwd -P)/ubuntu.sh
fi

echo "Installing common programs"
. $(pwd -P)/common.sh
echo "Starting config files sync"
. $(pwd -P)/sync.sh

# install n - node version manager
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
bash n lts
[[ -f n ]] && rm -rf n

# set fish as default shell
echo "Setting fish shell as default one"
chsh -s $(which fish)

echo "Installing fish package manager - fisher"
install_fisher

echo "Done. Reload your terminal."
