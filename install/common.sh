#!/bin/bash

# Rust
curl https://sh.rustup.rs -sSf | sh

# Vim Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Kitty terminal

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

echo -e "\\n\\nInstalling essential tools\\n\\n"

./cargo.sh
