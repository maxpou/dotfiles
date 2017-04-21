#!/bin/bash

info() {
    printf "  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

success() {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

info '(did you disable proxy before?)'

# update
brew update
brew upgrade
brew cleanup -s
brew cask cleanup

# now diagnotic
brew doctor
brew missing
apm upgrade -c false
npm update -g


echo ''
echo 'All is good, you can now reenable proxy 😀'
