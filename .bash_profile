[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

export PATH="/Users/msull92/Library/Application Support/GoodSync":$PATH
export GITHUB_TOKEN='890ecd3cbb5c825afc7aebf33f4502dbaae4d8ac'

#!/bin/bash

alias ll='ls -lah'
alias gg='git status -s'

alias clean="RAILS_ENV=development rake assets:clean; RAILS_ENV=development rake tmp:clear; RAILS_ENV=test rake assets:clean; RAILS_ENV=test rake tmp:clear"

alias "gt"="git log --oneline --graph --color --all --decorate"
alias sly='sprintly'

PATH=$PATH:/usr/local/Cellar/python/2.7.6_1/bin/python
PATH=$PATH:/usr/local/git/bin/
PATH=$PATH:/usr/local/bin/deis

# Complete rake tasks script for bash
complete -C /Users/msull92/Projects/rake_autocomplete.rb -o default rake

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}

export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

source ~/.codelation/bash/.codelation.bash

BRIGHT_BLACK="\[\033[0;38m\]"
export PS1=$MAGENTA"\u"$BRIGHT_BLACK" in "$GREEN"\w"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
      # a file has been modified but not added
      then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
      # a file has been added, but not commited
      then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
      # the state is clean, changes are commited
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$YELLOW" λ"$BRIGHT_BLACK" "

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
