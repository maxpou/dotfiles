export ZSH=~/.oh-my-zsh
export EDITOR='vim'
export URLPROXY=''
export HTTPPROXY='http://'$URLPROXY
export HTTPSPROXY='https://'$URLPROXY

ZSH_THEME="af-magic"

plugins=(git github history composer vagrant docker thefuck)

# add aliases
source $HOME/.aliases
source $HOME/.aliases_custom

source $ZSH/oh-my-zsh.sh
