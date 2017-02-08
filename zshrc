export ZSH=~/.oh-my-zsh
export EDITOR='vim'
export HTTPPROXY=''
export HTTPSPROXY=''

ZSH_THEME="af-magic"

plugins=(git github history composer vagrant docker)


# add aliases
source $HOME/.aliases
source $HOME/.aliases_custom

source $ZSH/oh-my-zsh.sh
