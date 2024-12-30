alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ls='ls $LS_OPTIONS -hF'
alias ll='ls $LS_OPTIONS -lAhF'
alias hosts='sudo $EDITOR /etc/hosts'

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -v'
alias cp='cp -v'
function mkcd(){
    mkdir -p $1
    cd $1
}

# Git
alias git=hub
alias g="git"
alias gst="git status"
alias gc='git commit -v'
alias git-stashpopforce='git stash show -p | git apply && git stash drop'
alias git-cleanbranches="git for-each-ref --format '%(refname:short)' refs/heads | grep -v \"master\|main\" | xargs git branch -D"
alias yolo='git push --force'
alias gco='git checkout'
alias ga='git add'
alias gp='git push'

# using: git-reset-author old-mail@mail.com
git-reset-author() {
    git filter-branch --env-filter '
    OLD_EMAIL="maxence.poutord@visma.com"
    CORRECT_NAME="Maxence POUTORD"
    CORRECT_EMAIL="maxence.poutord@gmail.com"
    if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_COMMITTER_NAME="$CORRECT_NAME"
        export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
    fi
    if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_AUTHOR_NAME="$CORRECT_NAME"
        export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
    fi
    ' --tag-name-filter cat -- --branches --tags
}

git-standup() {
    AUTHOR=${AUTHOR:="`git config user.name`"}

    since=yesterday
    if [[ $(date +%u) == 1 ]] ; then
        since="2 days ago"
    fi

    git log --color --all --graph --since "$since" --author="$AUTHOR" --pretty=format:'%Cred %C(bold blue)<%an>%Creset -%C(yellow)%d%Creset %Cgreen(%cr)%Creset %B'
}

alias glols='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --stat'
alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'
#                                              │                  │         │          │                  └─ committer name
#                                              │                  │         │          └─ date (relative)
#                                              │                  │         └─ message
#                                              │                  └─ decorations (branch, heads or tags)
#                                              └─ hash (abbreviated)


# Personal projects folders
alias cdp='cd $HOME/sites'
alias cdlab='cd $HOME/sites/lab'

# RAM
alias ram='ps aux | awk '"'"'{print $6/1024 " MB\t\t" $11}'"'"' | sort -rn | head -25'

# iMac + dual screen => 💔
dock() {
    defaults write com.apple.dock position-immutable -bool YES; killall Dock
}

ds_fucking_store() {
    sudo find / -name ".DS_Store" -depth -exec rm {} \;
}


# HTTP/REST API
jsonapi() {
    http "$@" Accept:application/vnd.api+json Content-Type:application/vnd.api+json
}

pyserver() {
    if [[ $OSTYPE == darwin* ]] ; then
        /usr/bin/open -a "/Applications/Google Chrome.app" 'http://127.0.0.1:8000/'
    else
        google-chrome "http://0.0.0.0:8000/"
    fi
    python -m SimpleHTTPServer 8000
}

# Greenkeeper
alias greenkeeper-clean="git fetch -p && git branch --remote | fgrep greenkeeper | sed 's/^.\{9\}//' | xargs git push origin --delete"

# WTF 😇
# alias russian-roulette='[ $(( $RANDOM % 6 )) == 0 ] && rm -rf / || echo "You live"'

# Show/hide hidden files (starting with a `.`)
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# change mac addresss and get unlimitted wifi in airport
function airport() {
  local mac=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
  sudo ifconfig en0 ether $mac
  sudo ifconfig en0 down
  sudo ifconfig en0 up
  echo "Your new physical address is $mac"
}

function setupPrettier() {
    mkdir -p .vscode
    echo '{
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode"
}
' > .vscode/settings.json
}

# when CrossOver&Age of Empire is down
function killAoE() {
  kill -9 $(ps aux | grep '[P]rogram Files' | awk '{print $2}')
  kill -9 $(ps aux | grep '[A]ge of Empires II' | awk '{print $2}')
  kill -9 $(ps aux | grep '[S]team' | awk '{print $2}')
  kill -9 $(ps aux | grep '[e]xplorer\.exe' | awk '{print $2}')
}
