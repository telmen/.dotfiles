#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  . ./brew.sh
  . ./macos.sh
elif  [[ "$OSTYPE" == "linux"* ]]; then
  . ./unix.sh
fi
. ./sync.sh

chsh -s $(which fish)
# Install fisher (fish package manager)
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher
. ~/.config/fish/config.fish
