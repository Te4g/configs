#!/bin/sh

# Homebrew Script for OSX

echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" 

echo "Installing brew cask..."
brew tap homebrew/cask

# Dev Tools
brew install git
brew install composer
brew install node
brew install yarn
brew cask install docker
brew cask install github
brew cask install phpstorm

# Communication Apps
brew cask install slack
brew cask install microsoft-teams

# Web Tools
brew cask install google-chrome
brew cask install postman
brew cask install vlc
