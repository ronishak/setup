#!/usr/bin/env bash
echo
echo "Starting Machine Setup"
echo

# Fail immediately if any errors occur
# set -e
sudo -K
sudo true;

echo
echo "Lets Roll"

# Homebrew needs to be set up first
echo

if hash brew 2>/dev/null; then
  echo "Homebrew is already installed!"
else
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo
echo "Ensuring you have the latest Homebrew..."
brew update

echo
echo "Ensuring your Homebrew directory is writable..."
sudo chown -R $(whoami) /usr/local/bin

echo
echo "Installing Homebrew services..."
brew tap homebrew/services

echo
echo "Upgrading existing brews..."
brew upgrade

echo "Cleaning up your Homebrew installation..."
brew cleanup

echo
echo "Adding Homebrew's sbin to your PATH..."
echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.bash_profile

# echo
# echo "Linking Mac App Store"
# brew install mas
# mas signin --dialog ronald@ishak.net

echo
echo "Preparing Cask"
# Add more from here https://caskroom.github.io/search
brew tap caskroom/cask

echo
echo "Installing Browsers"

brew cask install google-chrome
brew cask install firefox
brew cask install torbrowser

echo
echo "Installing Dev Tools"

# brew install git
brew cask install sublime-text
brew cask install atom
brew cask install dash
brew cask install postman
brew cask install iterm2
brew cask install macdown
brew cask install transmit
# brew cask install virtualbox # needs password
# postgresql
# heroku-toolbelt
# pip2
# zsh

echo
echo "Installing Productivity Tools"

brew cask install lastpass
brew cask install google-backup-and-sync
brew cask install alfred
# brew cask install microsoft-office # needs password
brew cask install evernote
# brew cask install fantastical

echo
echo "Installing MacOS Tools"

brew cask install bettertouchtool
brew cask install hazel
brew cask install istat-menus
brew cask install dnscrypt
brew cask install transmission
brew cask install torguard

echo
echo "Installing Communication Tools"

brew cask install rambox
brew cask install slack
brew cask install skype
brew cask install whatsapp
brew cask install textual
brew cask install zoomus

echo
echo "Installing Media Apps"

brew cask install spotify
brew cask install vlc
brew cask install kindle
brew cask install calibre

echo
echo "Installing Graphic Apps"

# brew cask install adobe-creative-cloud
# brew cask install adobe-photoshop-cc
# brew cask install adobe-illustrator-cc
brew cask install sketch

echo
echo "Installing Screen Recording Tools"

brew cask install recordit
brew cask install screenflow

echo
echo "Installing NodeJS"

brew install node

echo
echo "-----------------------------------------"
echo "Done!"
echo "-----------------------------------------"
