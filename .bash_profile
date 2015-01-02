
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

export PATH="/Users/msull92/Library/Application Support/GoodSync":$PATH
export VAGRANT_HOME='/Volumes/msull92-passport/vagrant_home'

#!/bin/bash

source ~/.git-completion.bash
source ~/.git-prompt.sh

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export PS1=$LIGHT_GRAY"\u@\h"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$BLUE" \w"$GREEN": "

alias ll='ls -lah'
alias gg='git status -s'

alias clean="RAILS_ENV=development rake assets:clean; RAILS_ENV=development rake tmp:clear; RAILS_ENV=test rake assets:clean; RAILS_ENV=test rake tmp:clear"

alias "gt"="git log --oneline --graph --color --all --decorate"

PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
PATH=$PATH:/usr/local/Cellar/python/2.7.6_1/bin/python
PATH=$PATH:/usr/local/git/bin/

# Complete rake tasks script for bash
complete -C /Users/msull92/Projects/rake_autocomplete.rb -o default rake

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

alias "git"="hub"

# alias ctags
alias ctags="`brew --prefix`/bin/ctags"
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

alias "taggit"="ctags -R"

