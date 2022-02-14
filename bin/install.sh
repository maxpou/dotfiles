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
info '🛠 .zshrc & .gitconfig (global)'
link_files zshrc ~/.zshrc
link_files gitconfig ~/.gitconfig
git config --global core.excludesfile ~/.gitignore_global
echo .DS_Store > ~/.gitignore_global

# vim
link_files vim ~/.vim
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
sh ./vscode/install_plugin.sh

info 'Install VSCode configuration'
if [[ $OSTYPE == darwin* ]] ; then
    # MacOS
    link_files vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
    link_files vscode/settings.json    ~/Library/Application\ Support/Code/User/settings.json
    mkdir -p ~/Library/Application\ Support/Code/User/snippets
    ln -s $CURRENT/vscode/snippets/*.json  ~/Library/Application\ Support/Code/User/snippets
else
    # Unix
    link_files vscode/keybindings.json ~/.config/Code/User/keybindings.json
    link_files vscode/settings.json    ~/.config/Code/User/settings.json
fi

info '🛠 Install NPM utilities'
sh bin/install-npm-globals.sh


info '🛠 Finder'
# Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# For my 27" screen
defaults -currentHost write -g AppleFontSmoothing -int 0

echo ''
echo 'All installed 😀'
