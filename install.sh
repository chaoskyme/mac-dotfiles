#!/bin/bash

echo "=> install Xcode Command Line Tools"
xcode-select --install

echo "=> change zsh"
chsh -s /bin/zsh

echo "=> install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "=> chown /usr/local"
sudo chown -R `whoami` /usr/local

echo "=> install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask

echo "=> update Homebrew"
brew update && brew upgrade && brew cleanup

echo "=> install brew formulas"
brew install cmake git git-flow jenkins ldid nvm openssl openssl@1.1 python python3 tldr tree wget zsh-syntax-highlighting java

# 文件预览插件
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package cheatsheet

brew cask install launchrocket
brew cask install sqlitebrowser

echo "=> install RVM"
curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles
source ~/.rvm/scripts/rvm
rvm install 2.3.3
rvm use 2.3.3 --default
gem update --system

echo "=> install Ruby Gems"
gem install tty

echo "=> install Xcode toolchain"
brew install rswift
brew install carthage
brew install appledoc
brew install xctool
brew cask install oclint
gem install xcpretty
gem install nomad-cli
gem install cocoapods
gem install fastlane
gem install update_xcode_plugins

echo "=> update user's defaults"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles true
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true && \
defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true && \
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.TextEdit RichText -int 0
hash tmutil &> /dev/null && sudo tmutil disablelocal
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
chflags nohidden ~/Library
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

