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
brew cask install phpstorm

# Communication Apps
brew cask install slack
brew cask install microsoft-teams

# Web Tools
brew cask install brave-browser
brew cask install postman
brew cask install vlc

# Custom shell
npm install --global pure-prompt
rm ~/.zshrc && touch ~/.zshrc
echo '
export CLICOLOR=1
autoload -U promptinit; promptinit
prompt pure
' >> ~/.zshrc
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
echo '
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
' >> ~/.zshrc

# Aliases
echo '
# Perform "ls" after "cd" if successful
cdls() {
  builtin cd "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
    ls
  fi
}
alias cd="cdls"

# Docker
alias dc="docker-compose"
alias dcbc="docker-compose exec php bin/console"
' >> ~/.zshrc
