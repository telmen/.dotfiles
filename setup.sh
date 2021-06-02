#!/bin/bash

# macOS specific installations
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

  echo -e "\\n\\nRunning macOS related stuffs..."
  echo "============================"
  . $(pwd -P)/macos.sh

elif [[ "$OSTYPE" == "linux"* ]]; then
  printf "\e[0;31m  [✖] $1\e[0m\n"
  exit 1
fi

echo "Starting config files sync"
. $(pwd -P)/sync.sh

# set fish shell as default shell
echo "Setting fish shell as default one"
chsh -s $(which fish)

source  ~/.config/fish/config.fish

echo "Done."
