#!/bin/bash

success() {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}


# update
brew update
brew upgrade
brew cleanup -s
brew cask cleanup

# now diagnotic
brew doctor
brew missing


echo ''
success 'All is good 😀'
