#!/usr/bin/env bash
clear
echo "Starting Ron Ishak's Machine Setup"
echo "https://github.com/ronishak/setup/"
echo
echo "Enter your password"

# Fail immediately if any errors occur
# set -e

# Ask for sudo upfront
sudo -K 
sudo true;

# Keep-alive: update existing `sudo` time stamp until finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install all available updates
sudo softwareupdate -iva

# Install Xcode command line tools
xcode-select --install

MY_DIR="$(dirname "$0")"

# Prep
source ${MY_DIR}/homebrew.sh
# source ${MY_DIR}/mas.sh

brew tap caskroom/cask
brew install wget

# Add more from here https://caskroom.github.io/search

# Core Apps
brew cask install alfred
brew cask install iterm2
brew cask install java

# Browsers
brew cask install google-chrome
brew cask install firefox
brew cask install torbrowser

# Dev Tools
brew install git
brew cask install sublime-text
brew cask install atom
brew cask install virtualbox
brew cask install dash
brew cask install postman
brew cask install macdown
brew cask install vagrant
brew cask install transmit
brew install heroku-toolbelt
heroku update

# brew install docker
# postgresql
# pip2
# zsh
# awscli

# Productivity Tools
brew cask install lastpass
open '/usr/local/Caskroom/lastpass/latest/LastPass Installer.app'
brew cask install google-backup-and-sync
brew cask install microsoft-office
brew cask install evernote
brew cask install bettertouchtool
brew cask install hazel
brew cask install istat-menus
brew cask install dnscrypt
brew cask install transmission
brew cask install torguard

# Communication Tools
brew cask install rambox
brew cask install slack
brew cask install skype
brew cask install whatsapp
brew cask install textual
brew cask install zoomus

# Media Apps
brew cask install spotify
brew cask install vlc
brew cask install kindle
brew cask install calibre

# Graphic Apps
# brew cask install adobe-creative-cloud
# brew cask install adobe-photoshop-cc
# brew cask install adobe-illustrator-cc
brew cask install sketch

# Screen Recording Tools
brew cask install recordit
# brew cask install screenflow

# Node
brew install node
brew install postgres

# Git Alias
echo
echo "Setting up Git aliases..."
git config --global alias.gst git status
git config --global alias.st status
git config --global alias.di diff
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.sta stash
git config --global alias.llog "log --date=local"
git config --global alias.flog "log --pretty=fuller --decorate"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.lol "log --graph --decorate --oneline"
git config --global alias.lola "log --graph --decorate --oneline --all"
git config --global alias.blog "log origin/master... --left-right"
git config --global alias.ds diff --staged
git config --global alias.fixup commit --fixup
git config --global alias.squash commit --squash
git config --global alias.unstage reset HEAD
git config --global alias.rum "rebase master@{u}"
echo "#Git" >> ~/.bash_it/aliases/enabled/general.aliases.bash
echo "alias gst='git status'" >> ~/.bash_it/aliases/enabled/general.aliases.bash

# Cleanup
brew cleanup

echo
echo "Finished! Enjoy your new computer!"