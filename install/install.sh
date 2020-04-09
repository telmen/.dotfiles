#!/bin/bash

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
  printf "\e[0;31m  [✖] $1\e[0m\n"
  exit 1
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

echo "Done. Reload your terminal."
