#!/usr/bin/env sh

function dotfiles() {
  find . -type f -name ".*" -execdir ln -vs "$(cd "$(dirname {})" && pwd -P)/$(basename {})" ~ ';'
  . ~/.zshrc
}

function vscode() {
  echo "Copying vscode settings"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    [ -f $HOME/vscode/custom.css ] && ln -s $HOME/vscode/custom.css ~/Library/Application\ Support/Code\ -\ Insiders/User/custom.css
    [ -f $HOME/vscode/keybindings.json ] && ln -s $HOME/vscode/keybindings.json ~/Library/Application\ Support/Code\ -\ Insiders/User/keybindings.json
    [ -f $HOME/vscode/settings.json ] && ln -s $HOME/vscode/settings.json ~/Library/Application\ Support/Code\ -\ Insiders/User/settings.json
    [ -d $HOME/vscode/snippets ] && ln -s $HOME/vscode/snippets ~/Library/Application\ Support/Code\ -\ Insiders/User/snippets
    [ -f $HOME/vscode/syncLocalSettings.json ] && ln -s $HOME/vscode/syncLocalSettings.json ~/Library/Application\ Support/Code\ -\ Insiders/User/syncLocalSettings.json
  fi
}

function fonts() {
  echo "Copying Consolas font"
  if [[ "$OSTYPE" == "darwin"* ]]; then
    rsync -avh fonts/* ~/Library/Fonts
  fi
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
  dotfiles;
  # vscode;
  # fonts;
fi;

unset dotfiles;
unset vscode;
unset fonts;
