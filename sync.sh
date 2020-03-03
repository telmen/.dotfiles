#!/bin/bash

function dotfiles() {
  # Fix me
  find . -type f -name '.*' -printf '%f\n' | while read f; do
    ln -sfvnr $f ~
  done
  if [[ -d ~/.config/fish ]]; then
    echo "~/.config/fish already exists... Skipping."
  else
    ln -sfvnr fish ~/.config/fish
    echo "Done"
  fi
}

function configs() {
  config_files=$( find "$(pwd)/config" -maxdepth 1 2>/dev/null )
  for config in $config_files; do
    target="$HOME/.config/$( basename "$config" )"
    if [ -e "$target" ]; then
      echo "~${target#$HOME} already exists... Skipping."
    else
      echo "Creating symlink for $config"
      ln -s "$config" "$target"
    fi
  done
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo -e "\\n"
  read -p "Sync dotfiles?" -n 1
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    dotfiles
  fi
  echo -e "\\n"
  read -p "Sync configs?" -n 1
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    configs
  fi
  echo -e "\\n"
fi

unset dotfiles
unset configs
