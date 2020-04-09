#!/bin/bash

print_question() {
  # Print output in yellow
  printf "\e[0;33m  [?] $1\e[0m"
}

print_success() {
  # Print output in green
  printf "\e[0;32m  [✔] $1\e[0m\n"
}

print_error() {
  # Print output in red
  printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

print_info() {
  # Print output in purple
  printf "\n\e[0;35m $1\e[0m\n\n"
}

print_result() {
  [ $1 -eq 0 ] \
    && print_success "$2" \
    || print_error "$2"

  [ "$3" == "true" ] && [ $1 -ne 0 ] \
    && exit
}

execute() {
  $1 &> /dev/null
  print_result $? "${2:-$1}"
}

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

dotfiles() {
  # Find all . files in this folder
  files_to_symlink=$(find . -type f -maxdepth 1 -name ".*" -not -name .DS_Store -not -name .git -not -name .osx | sed -e 's|//|/|' | sed -e 's|./.|.|')
  files_to_symlink="$files_to_symlink .config/fish .config/nvim"
  local i=""
  local sourceFile=""
  local targetFile=""

  for i in ${files_to_symlink[@]}; do
    sourceFile="$(pwd)/$i"
    targetFile="$HOME/$(printf "%s" "$i")"

    if [ -e "$targetFile" ]; then
      if [ "$(readlink "$targetFile")" != "$sourceFile" ]; then
        ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
        if answer_is_yes; then
          rm -rf "$targetFile"
          execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        else
          print_error "$targetFile → $sourceFile"
        fi
      else
        print_success "$targetFile → $sourceFile"
      fi
    else
      execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
    fi
  done
}

ask_for_confirmation "This may overwrite existing files in your home directory. Are you sure?"
if answer_is_yes; then
  ask_for_confirmation "Sync dotfiles?"
  if answer_is_yes; then
    dotfiles
  fi
fi

unset dotfiles
