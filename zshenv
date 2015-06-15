export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH=~/bin:$PATH
export PATH=~/local/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
export PATH=$(ruby -rubygems -e "puts Gem.user_dir")/bin:$PATH
export PATH=~/workspace/go/bin:$PATH
export PATH=./node_modules/.bin:$PATH
export PATH=./vendor/bin:$PATH
export PATH=./bin:$PATH
export PATH=./app:$PATH
export PATH=./:$PATH
export GOPATH=~/workspace/go
export EDITOR=vim
export PAGER=less
export SYSTEMD_EDITOR=vim
export BROWSER=chromium
export HISTFILE=~/.zsh_history
export HISTSIZE=500000
export SAVEHIST=500000

alias ll='ls -Alh --color=auto -F'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias grh='git reset HEAD'
alias gc='git commit'
alias gph='git push'
alias gpl='git pull'
alias gpr='git pull --rebase'
alias grc='git rebase --continue'
alias gco='git checkout'
alias sf='console'
alias sfp='console -e=prod --no-debug'
alias ci='composer install --prefer-dist'
alias cu='composer update --prefer-dist'
alias cr='composer require'
alias gn='git log --reverse --format=%H HEAD..ORIG_HEAD | head -1 | xargs git checkout'
alias gp='git checkout HEAD~'
alias start='sudo systemctl restart'
alias stop='sudo systemctl stop'
alias pcat='pygmentize -f terminal256 -O style=native -g'
alias tm='tmux new -s $(basename $(pwd))'
alias l="xbacklight -set"
alias ya="yaourt --noconfirm"
alias dc="docker-compose"
alias dcl="docker-compose logs"
alias dcp="docker-compose ps"
alias dcu="docker-compose up -d"
alias dcu-nd="docker-compose up -d --no-deps"
alias dcu-nr="docker-compose up -d --no-recreate"
alias dcr="docker-compose run --rm"
alias de="docker exec -it"
alias drm="docker ps -qa | xargs docker rm -fv"
alias myip="curl http://ipecho.net/plain ; echo"
alias dm="docker-machine"
