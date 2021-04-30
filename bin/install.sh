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

# zsh
link_files zshrc ~/.zshrc

# vim
# link_files vim ~/.vim
# link_files vim/vimrc ~/.vimrc
if [ -d "~/.SpaceVim.d" ]; then
    link_files iterm/init.toml ~/.SpaceVim.d/init.toml
else
    info '⚠️ SpaceVim not installed'
fi

# Aliases
link_files .aliases.sh ~/.aliases
if ! [ -f .aliases_custom.sh ]; then
    info '⚙️ Create new empty aliases_custom file'
    touch .aliases_custom.sh
else
    info 'ℹ️ aliases_custom already created, skipping'
fi
link_files .aliases_custom.sh ~/.aliases_custom


# VSCode
info '🛠 Install VSCode plugins'
source "$(dirname "${BASH_SOURCE[0]}")"/../vscode/install_plugin.sh

info 'Install VSCode configuration'
if [[ $OSTYPE == darwin* ]] ; then
    # MacOS
    ln -sf vscode/keybindings.json ~/Library/Application Support/Code/User/keybindings.json
    ln -sf vscode/settings.json    ~/Library/Application Support/Code/User/settings.json
else
    # Unix
    ln -sf vscode/keybindings.json ~/.config/Code/User/keybindings.json
    ln -sf vscode/settings.json    ~/.config/Code/User/settings.json
fi

info '🛠 Install NPM utilities'
sh ./install-npm-globals.sh


echo ''
echo 'All installed 😀'
