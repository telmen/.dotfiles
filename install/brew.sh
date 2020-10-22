#!/bin/bash

brew update
brew upgrade

BREW_PREFIX=$(brew --prefix)

brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed

brew tap wix/brew

# Do some cleaning

brew install applesimutils

brew install \
  autoconf \
  automake \
  bat \
  cmake \
  cocoapods \
  curl-openssl \
  dex2jar \
  dive \
  fastlane \
  exercism \
  gcc \
  git \
  git-extras \
  git-lfs \
  git-standup \
  git-crypt \
  gnu-sed \
  gnupg \
  gnutls \
  highlight \
  htop \
  httpie \
  hub \
  imagemagick \
  jq \
  nmap \
  node \
  openssl \
  python \
  readline \
  rename \
  ripgrep \
  ruby \
  sqlite \
  ssh-copy-id \
  watchman \
  wget \
  wifi-password \
  yarn \
  fish \
  git-flow \
  vim \
  xctool \
  git-delta \
  z \
  entr \
  the_silver_searcher \
  exa \
  fzf \
  pv \
  terminal-notifier \
  pidcat \
  ncdu

# brew casks

brew cask install \
  alfred \
  qlimagesize \
  quicklookase \
  fing \
  enpass \
  dozer \
  discord \
  qlmarkdown \
  react-native-debugger \
  qlstephen \
  reactotron \
  kap \
  qlvideo \
  suspicious-package \
  qlcolorcode \
  quicklook-json \
  webpquicklook \
  rectangle \
  gyazo \
  sublime-text \
  imageoptim \
  imagealpha \
  firefox \
  google-chrome \
  spotify \
  gpg-suite \
  android-sdk \
  android-platform-tools \
  telegram \
  visual-studio-code \
  clipy \
  sip \
  itsycal \
  figma \
  tunnelbear 

brew cleanup
