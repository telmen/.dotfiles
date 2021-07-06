#!/bin/bash


ask_for_confirmation() {
  print_question "$1 (y/n) "
  read -n 1
  printf "\n"
}

answer_is_yes() {
  [[ "$REPLY"  =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

# macOS specific installations
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo -e "\\n\\nRunning on macOS"

  if test ! "$(command -v brew)"; then
    echo -e "\\n\\nInstalling homebrew.."
    echo "============================"
    ruby -e "$( curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"
  fi


  ask_for_confirmation "Install brew formulas?"
  if answer_is_yes; then
    echo -e "\\n\\nRunning brew formulas installation..."
    echo "============================"
    . $(pwd -P)/brew.sh
  fi

  echo -e "\\n\\nRunning fzf install script..."
  echo "============================"
  /usr/local/opt/fzf/install --all --no-bash --no-zsh 


  ask_for_confirmation "Setup macOS configurations?"
  if answer_is_yes; then
    echo -e "\\n\\nRunning macOS related configurations..."
    echo "============================"
    . $(pwd -P)/macos.sh
  fi

elif [[ "$OSTYPE" == "linux"* ]]; then
  printf "\e[0;31m  [✖] $1\e[0m\n"
  exit 1
fi

ask_for_confirmation "Start configuration files syncing?"
if answer_is_yes; then
  echo -e "\\n\\nRunning configuration files sync..."
  echo "============================"
  . $(pwd -P)/sync.sh
fi

ask_for_confirmation "Set fish as default shell?"
if answer_is_yes; then
  echo -e "\\n\\nSetting fish as default shell.."
  echo "============================"
  chsh -s $(which fish)
fi


source  ~/.config/fish/config.fish

echo "Done."
