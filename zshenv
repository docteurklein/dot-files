export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export LD_PRELOAD="/usr/lib/libstderred.so"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin/core_perl:/usr/bin
export PATH=~/.bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
export PATH=node_modules/.bin:$PATH
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.cabal/bin:$PATH
export PATH=bin:vendor/bin:$PATH
#export PATH=$(ruby -rubygems -e "puts Gem.user_dir")/bin:$PATH
export PATH=~/work/go/bin:$PATH
export PATH=~/.cargo/bin:$PATH
export GOPATH=~/work/go
export EDITOR=vim
export PAGER=less
export LESS='-SRXFi'
export SYSTEMD_EDITOR=vim
export BROWSER=chromium

bindkey '^[^M' self-insert-unmeta

alias ll='ls -Alh --color=auto -F'
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias grh='git reset HEAD'
alias gc='git commit'
alias gph='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gpr='git pull --rebase'
alias grc='git rebase --continue'
alias sf='console'
alias sfp='console -e=prod --no-debug'
alias ci='composer install --prefer-dist'
alias cu='composer update --prefer-dist'
alias cr='composer require'
alias pcat='pygmentize -f terminal256 -O style=native -g'
alias tm='tmux attach -t $(basename $(pwd)) || tmux new -s $(basename $(pwd))'
alias tmf='tmux new -s $(basename $(pwd)) tmux source-file .tmux.conf'
alias l="xbacklight -set"
alias ya="yaourt --noconfirm --color --pager"
alias dc="docker-compose --compatibility"
alias dcl="docker-compose --compatibility logs -f --tail=100"
alias dcp="docker-compose --compatibility ps"
alias dcu="docker-compose --compatibility up -d --remove-orphans"
alias dcr="docker-compose --compatibility run --rm"
alias dce="docker-compose --compatibility exec"
alias de="docker exec -it"
alias denv='env|grep -e DOCKER -e COMPOSE'
alias ds="docker ps --format '{{ .Names }}' | xargs --no-run-if-empty docker stats --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}'"
alias dcs="docker-compose ps -q | xargs --no-run-if-empty docker stats --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}\t{{.PIDs}}'"
alias dr="docker run --rm -it"
alias drm="docker ps -qa | xargs --no-run-if-empty docker rm -fv"
alias myip="curl http://ipecho.net/plain ; echo"
alias dm="docker-machine"
alias r="phpspec run"
alias s="sudo -E systemctl"
alias j="sudo -E journalctl"
alias n='sudo -E netctl'
alias d="docker"
alias k="kubectl"
alias kl="kubectl logs --tail=100 -f"
alias ke="kubectl exec -it"
alias kg="kubectl get"
alias kd="kubectl describe"
alias ks='kubectl config set-context --current --namespace'
alias ytj="ruby -ryaml -rjson -e 'puts JSON.generate(YAML.load(ARGF))'"
alias o='xdg-open'
alias html='w3m -dump -T text/html -cols $COLUMNS'
alias h='curl -sSL'

function duh {
    du -h --max-depth=${2-1} "$1" | sort -hr
}

function dse {
    local args=${*:2}
    de $(docker ps -q --filter label=com.docker.swarm.service.name=$1) $args
}

function tldr {
    curl -sL "https://api.github.com/repos/tldr-pages/tldr/contents/pages/common/$1.md?ref=master" | jq -r '.content' | base64 -d - | markdown-cli
}

function composer-autoload {
    local script=$(cat <<JQ
        .autoload."psr-4" |= . + {"$1": "$2"}
JQ
)
    cat composer.json | jq --indent 4 "$script" | tee composer.json > /dev/null && composer dump-autoload
}

function devip {
    ip -4 a show dev $1 | grep -Po 'inet \K[\d.]+'
}
