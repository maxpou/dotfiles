export ZSH=~/.oh-my-zsh
export EDITOR='vim'



# add aliases
source $HOME/.aliases
source $HOME/.aliases_custom

source $ZSH/oh-my-zsh.sh
ZSH_THEME=""
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/usr/local/bin:$PATH"

plugins=(git github history npm zsh-autosuggestions)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# uncomment next 11 lines to re-enable conda
# __conda_setup="$('/Users/maxence/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/maxence/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/maxence/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/maxence/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"
