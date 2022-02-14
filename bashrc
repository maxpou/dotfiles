export EDITOR='vim'
export HUSKY=0 # Fuck you Husky

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source $HOME/.aliases
source $HOME/.aliases_custom
