#!/usr/bin/env sh

export ZSH=$HOME/.oh-my-zsh

[ -f ~/.exports ] && . ~/.exports
[ -f ~/.aliases ] && . ~/.aliases
[ -f ~/.functions ] && . ~/.functions

ZSH_THEME="theunraveler"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
  wd
  dircycle
  dirhistory
  dirpersist
  encode64
  fasd
  gem
  jsontools
  lol
  compleat
  autojump
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  docker-compose
  docker-machine
  dotenv
  cp
  lighthouse
  brew
  bundler
  common-aliases
  fzf
  yarn
  npm
)

. $ZSH/oh-my-zsh.sh
autoload -U promptinit; promptinit

[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
