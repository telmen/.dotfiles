#!/bin/bash

brew update
brew upgrade

BREW_PREFIX=$(brew --prefix)

brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names

# Do some cleaning

brew install \
  applesimutils \
  autoconf \
  automake \
  bat \
  cmake \
  cocoapods \
  curl-openssl \
  dex2jar \
  dive \
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
  git-delta

brew install z
brew install entr
brew install the_silver_searcher
brew install exa
brew install fzf
brew install pv
brew install terminal-notifier
brew install pidcat
brew install ncdu

# brew casks

brew tap homebrew/cask-caskroom

brew cask install \
  fastlane \
  qlimagesize \
  quicklookase \
  fing \
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
  android-platform-tools

brew tap homebrew/cask-fonts

brew cask install font-iosevka

brew cleanup
