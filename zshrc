export ZSH=~/.oh-my-zsh
export EDITOR='vim'
export URLPROXY=''
export HTTPPROXY='http://'$URLPROXY
export HTTPSPROXY='https://'$URLPROXY

ZSH_THEME="af-magic"

plugins=(docker git github history npm)

# add aliases
source $HOME/.aliases
source $HOME/.aliases_custom

source $ZSH/oh-my-zsh.sh
