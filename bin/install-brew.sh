# CLI tools
brew install zsh
brew install node
brew install tree
brew install hub
brew install gnupg

brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

# cask
brew cask install iterm2
brew cask install pgadmin4