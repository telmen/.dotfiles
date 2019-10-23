#!/usr/bin/env sh

# macOS

if [[ "$OSTYPE" == "darwin"* ]]; then
  . ./brew.sh
  . ./macos.sh
fi

# install zsh

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt install zsh
fi

chsh -s $(which zsh)

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
