# allows git aliases to work in all shell environments
alias ga='git add'
alias gaa='git add --all'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcsm='git commit -s -m'
alias gcb='git checkout -b'

alias gcmsg='git commit -m'
alias gco='git checkout'
alias ggpull='git pull origin $(git_current_branch)'
alias ggpush='git push origin $(git_current_branch)'
alias grbi='git rebase -i'
alias gst='git status'

function nuke {
  grep -v ${1} ~/.ssh/known_hosts > /tmp/known_hosts && mv -f /tmp/known_hosts ~/.ssh/known_hosts
  printf " - \e[41m${1}\e[49m: host key removed from ~/.ssh/known_hosts\n"
}

function gpr {
  pull_request_uri=https://github.com/$(git config --local --get remote.origin.url | sed -E 's/.*://' | sed 's/.git//')/compare/$(git rev-parse --abbrev-ref HEAD)?expand=1
  open $pull_request_uri
}

function nvmload {
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}

function drmid {
  for image in $(docker images -qf dangling=true); do
	docker rmi -f $image
  done
}

alias dockup='docker-machine start dev && eval "$(docker-machine env dev)" && docker-machine ip dev'
alias gpr="gpr"
alias ll="ls -la"
alias nuke="nuke"
alias nvminit="nvmload"
alias rabbit="~/bin/load-rabbit-console"
alias vdup="vagrant destroy -f $1 && vagrant up $1"
# map vim to nvim because it is better
alias vim="nvim"
alias cat="colorize"

path+=/bin/zsh
