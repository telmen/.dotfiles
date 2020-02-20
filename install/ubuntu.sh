#!/bin/bash

function install_fish() {
  if command -v fish >/dev/null 2>&1; then
    echo "fish shell already installed"
  else
    echo "Adding fish v3 ppa"
    apt-add-repository ppa:fish-shell/release-3
    apt update
    echo "installing fish shell"
    apt install fish
  fi
}

install_fish

# create custom bin folder at user's home
if [[ ! -d $HOME/bin ]]; then
  mkdir $HOME/bin
fi

# install linuxbrew

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

# install yarn
curl -o- -L https://yarnpkg.com/install.sh | bash

if [[ ! -f diff-so-fancy ]]; then
  # install diff-so-fancy
  cd $HOME/bin
  curl -o- -L https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy >diff-so-fancy
  chmod +x $HOME/bin/*
  cd -
fi

# install tmux & nvim from source

brew install neovim
brew install tmux
