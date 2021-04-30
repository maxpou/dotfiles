#!/usr/bin/env bash

set -eo pipefail

CURRENT=$(pwd)

info() {
    printf "  [ \033[00;34m..\033[0m ] %s\n" "$1"
}

success() {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] %s\n" "$1"
}

fail() {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] %s\n" "$1"
    echo ''
    exit
}

link_files() {
    if [ -L "$2" ] ; then
        rm -f "$2"
    fi

    ln -s "$CURRENT/$1" "$2"
    success "linked $1 to $2"
}

# vim
link_files vim ~/.vim
link_files vim/vimrc ~/.vimrc

# Aliases
link_files .aliases ~/.aliases
if ! [ -f .aliases_custom ]; then
    info 'create new empty aliases_custom file'
    touch .aliases_custom
fi
link_files .aliases_custom ~/.aliases_custom

# bashrc
link_files bashrc ~/.bashrc

echo ''
echo 'All installed 😀'
