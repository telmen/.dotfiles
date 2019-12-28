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
  if [[ "$OSTYPE" == "darwin"* ]]; then
    [ -f $HOME/vscode/custom.css ] && ln -s $HOME/vscode/custom.css ~/Library/Application\ Support/Code/User/custom.css
    [ -f $HOME/vscode/keybindings.json ] && ln -s $HOME/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
    [ -f $HOME/vscode/settings.json ] && ln -s $HOME/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
    [ -d $HOME/vscode/snippets ] && ln -s $HOME/vscode/snippets ~/Library/Application\ Support/Code/User/snippets
    [ -f $HOME/vscode/syncLocalSettings.json ] && ln -s $HOME/vscode/syncLocalSettings.json ~/Library/Application\ Support/Code/User/syncLocalSettings.json
  fi
  echo "vscode: done"
}

function fonts() {
  echo "fonts: copying monospace fonts"
  if [[ "$OSTYPE" == "darwin"* ]]; then
    rsync -avh fonts/* ~/Library/Fonts
  else
    if [[ -d ~/.local/share/fonts/ ]]; then
      rsync -avh  fonts/* ~/.local/share/fonts/
    else
      mkdir ~/.local/share/fonts
      rsync -avh  fonts/* ~/.local/share/fonts/
    fi
  fi
  echo "fonts: done"
}

echo "============================"
echo "Initiating sync files script"
read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "====================="
  echo "sync: executing scripts"
  echo "====================="
  dotfiles;
  fishshell;
  vscode;
  fonts;
  echo "====================="
  echo "sync: done"
  echo "====================="
fi;

unset dotfiles;
unset vscode;
unset fonts;
unset fishshell;
