#!/bin/sh

# Homebrew Script for OSX

echo "Installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Configuring brew..."
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing brew cask..."
brew tap homebrew/cask

# Dev Tools
brew install git
brew install composer
brew install node
brew install yarn
brew install httpie
brew install serverless
brew install helm
brew install --cask docker
brew install --cask vagrant
brew install --cask phpstorm
brew install --cask datagrip
brew install --cask powershell
brew install --cask postman
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install gh
brew install ansible
brew install bat

# Communication Apps
brew install --cask slack
brew install --cask microsoft-teams

# Web Tools
brew install youtube-dl
brew install --cask google-chrome
brew install --cask vlc
brew install --cask teamviewer
brew install --cask mark-text
brew install --cask notion
brew install --cask syncthing
brew install --cask cakebrew

# Utils
brew install coreutils
brew install jq

# Miscellenaous
brew install --cask amazon-music

# Ffmpeg
brew tap homebrew-ffmpeg/ffmpeg
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-librsvg --with-openjpeg --with-libvmaf --with-zeromq

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
