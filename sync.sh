#!/bin/bash

function fishshell() {
  echo "fish shell: creating symbolic links"
  if [[ -d ~/.config/fish ]]; then
    echo "fish shell: a directory already exists. Creating backup folder of current configuration."
    cp -rf ~/.config/fish ~/fish.backup
    rm -rf ~/.config/fish
    ln -s "$(pwd -P)/fish" ~/.config/fish
  else
    ln -s "$(pwd -P)/fish" ~/.config/fish
  fi
  echo "fish shell: done"
}

function dotfiles() {
  echo "dotfiles: creating symbolic links"
  find . -type f -name ".*" -execdir ln -s "$(cd "$(dirname {})" && pwd -P)/$(basename {})" ~ ';'
  echo "dotfiles: done"
}

function vscode() {
  echo "vscode: copying settings"
  VSCODE_USER_PATH=~/Library/Application\ Support/Code/User
  if [[ "$OSTYPE" == "linux"* ]]; then
    VSCODE_USER_PATH=~/.config/Code/User
  fi
  [ -f $(pwd -P)/vscode/custom.css ] && ln -s $(pwd -P)/vscode/custom.css $VSCODE_USER_PATH/custom.css
  [ -f $(pwd -P)/vscode/keybindings.json ] && ln -s $(pwd -P)/vscode/keybindings.json $VSCODE_USER_PATH/keybindings.json
  [ -f $(pwd -P)/vscode/settings.json ] && ln -s $(pwd -P)/vscode/settings.json $VSCODE_USER_PATH/settings.json
  [ -d $(pwd -P)/vscode/snippets ] && ln -s $(pwd -P)/vscode/snippets $VSCODE_USER_PATH/snippets # FIXME: creates infinite symlinks
  [ -f $(pwd -P)/vscode/syncLocalSettings.json ] && ln -s $(pwd -P)/vscode/syncLocalSettings.json $VSCODE_USER_PATH/syncLocalSettings.json
  echo "vscode: done"
}

function fonts() {
  echo "fonts: copying monospace fonts"
  if [[ "$OSTYPE" == "darwin"* ]]; then
    rsync -avh fonts/* ~/Library/Fonts
  else
    if [[ -d ~/.local/share/fonts/ ]]; then
      rsync -avh fonts/* ~/.local/share/fonts/
    else
      mkdir ~/.local/share/fonts
      rsync -avh fonts/* ~/.local/share/fonts/
    fi
    fc-cache -fv
  fi
  echo "fonts: done"
}

echo "============================"
echo "starting sync script"
read -p "this may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "====================="
  echo "sync: executing scripts"
  echo "====================="
  dotfiles
  fishshell
  vscode
  fonts
  echo "====================="
  echo "sync: done"
  echo "====================="
fi

unset dotfiles
unset vscode
unset fonts
unset fishshell
