#!/bin/bash

function fishshell() {
  echo "fish shell: creating symbolic links"
  if [[ -d ~/.config/fish ]]; then
    echo "fish shell: a directory already exists. Creating backup folder of current configuration."
    cp -rf ~/.config/fish ~/fish.backup
    rm -rf ~/.config/fish
  fi
  ln -sfvnr fish ~/.config/fish
  echo "fish shell: done"
}

function dotfiles() {
  echo "dotfiles: creating symbolic links"
  find . -type f -name '.*' -printf '%f\n' | while read f; do
    ln -sfvnr $f ~
  done
  echo "dotfiles: done"
}

function vscode() {
  echo "vscode: copying settings"
  local VSCODE_USER_PATH=~/Library/Application\ Support/Code/User
  local VSCODE_EXTENSION_PATH=~/.vscode/extensions/
  if [[ "$OSTYPE" == "linux"* ]]; then
    VSCODE_USER_PATH=~/.config/Code/User
  fi
  if [[ -d $VSCODE_USER_PATH ]]; then
    [ -f vscode/custom.css &&  ] && ln -sfvnr vscode/custom.css $VSCODE_USER_PATH/custom.css
    [ -f vscode/keybindings.json ] && ln -sfvnr vscode/keybindings.json $VSCODE_USER_PATH/keybindings.json
    [ -f vscode/settings.json ] && ln -sfvnr vscode/settings.json $VSCODE_USER_PATH/settings.json
    [ -d vscode/snippets ] && rm -rf $VSCODE_USER_PATH/snippets && ln -sfvnr vscode/snippets $VSCODE_USER_PATH/snippets
    [ -f vscode/syncLocalSettings.json ] && rsync -avh vscode/syncLocalSettings.json $VSCODE_USER_PATH/syncLocalSettings.json
    [ -d vscode/seti-theme ] && rsync -avh vscode/seti-theme $VSCODE_EXTENSION_PATH/seti-theme
  else
    echo "vscode not installed, skips vscode config syncing"
  fi

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
