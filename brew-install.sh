#!/bin/sh

# Homebrew Script for OSX
# To execute: save and `chmod +x ./brew-install.sh` then `./brew-install.sh`

echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew cask..."
brew tap caskroom/cask

# Dev Tools
brew install git
brew install composer
brew install node
brew install yarn
brew cask install docker
brew cask install github-desktop
brew cask install phpstorm

# Communication Apps
brew cask install slack
brew cask install microsoft-teams

# Web Tools
brew cask install google-chrome
brew cask install postman
brew cask install vlc
