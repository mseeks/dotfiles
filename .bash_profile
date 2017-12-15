eval "$(docker-machine env main)"
eval "$(rbenv init -)"

alias git="hub"
alias gg="git status -s"
alias gt="git log --oneline --graph --color --all --decorate"
alias sd='eval "$(docker-machine env main)"'
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcs="docker-compose build; docker-compose up"
alias tglc="toggl get current"
alias tgle="toggl stop current"
alias gh='open "https://github.com'
alias ghst='open "https://github.com/orgs/MinneapolisStarTribune/dashboard"'
alias home="cd ~"
alias projects="cd ~/Projects"
alias gi="git issue"
alias gci="git issue create"
alias gpr="git push; git pull-request"
alias pandora="pianobar"
alias weather='curl wttr.in'
alias mgi="ghi list --mine"
alias gpr="git pull-request"
alias gs="git stash"
alias gsa="git stash apply"
alias gcm="git checkout master"
alias ll='exa -l'
alias lt='exa -T'

function diff() {
  colordiff "$@"
}

function v() {
  vim "$@"
}

function tgls () {
  toggl start $1
}

function avd () {
  ansible-vault decrypt $1
}

function ave () {
  ansible-vault encrypt $1
}

function avv () {
  ansible-vault view $1
}

function ap () {
  ansible-playbook "$@"
}

function a () {
  atom "$@"
}

function ga () {
  git add .
}

function gc () {
  commit_message="$@"
  git commit -am "$commit_message"
}

function gcb () {
  branch_name=$(echo "$@" | tr -s ' ' - | tr '[:upper:]' '[:lower:]')
  git checkout -b $branch_name
}

function gco () {
  branch_name=$(echo "$@" | tr -s ' ' - | tr '[:upper:]' '[:lower:]')
  git checkout $branch_name
}

function g} () {
  git push "$@"
}

function g{ () {
  git pull "$@"
}

function sbp () {
  source ~/.bash_profile
}

function ec2ls () {
  aws ec2 describe-instances "$@" --query 'Reservations[*].Instances[*].{Name:Tags[?Key==`Name`].Value,State:State.Name}' | jq '[flatten(2)[] | {name: .Name[0], state: .State}]'
}

function yt () {
  ytdl --print-url --filter-container=mp4 $1 | open-pip
}

function ia () {
  hf "$@" -cmd="atom"
}

function iavd () {
  hf "$@" -cmd="ansible-vault decrypt"
}

function iave () {
  hf "$@" -cmd="ansible-vault encrypt"
}

function iavv () {
  hf "$@" -cmd="ansible-vault view"
}

function icc () {
  hf "$@" cat | pbcopy
}

function cc() {
  cat "$@" | pbcopy
}

function fssh() {
  AWS_FUZZ_USER="matthew" AWS_FUZZ_KEY_PATH="~/.ssh/id_rsa" AWS_DEFAULT_PROFILE="$@" aws-fuzzy
}

PATH=$PATH:~/local/bin
PATH=$PATH:~/.gem/ruby/2.4.0/bin
PATH=$PATH:~/bin
PATH=$PATH:~/.cargo/bin
PATH=$PATH:~/go/bin
PATH=$PATH:/usr/local/bin
PATH=$PATH:~/Library/Python/3.6/bin

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

MAGENTA="\\[\\033[0;35m\\]"
YELLOW="\\[\\033[0;33m\\]"
BLUE="\\[\\033[34m\\]"
LIGHT_GRAY="\\[\\033[0;37m\\]"
CYAN="\\[\\033[0;36m\\]"
GREEN="\\[\\033[0;32m\\]"
BRIGHT_BLACK="\\[\\033[0;38m\\]"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export PS1=$MAGENTA"\u "$GREEN"\w"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
      # a file has been modified but not added
      then echo "'$YELLOW'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
      # a file has been added, but not commited
      then echo "'$MAGENTA'"$(__git_ps1 " (%s)")
      # the state is clean, changes are commited
    else echo "'$CYAN'"$(__git_ps1 " (%s)")
    fi)'$YELLOW" λ"$BRIGHT_BLACK" "

export PATH="$HOME/.cargo/bin:$PATH"
