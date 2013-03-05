export PATH="$PATH:/usr/bin/vendor_perl"
export PATH="$PATH:/home/florian/bin"
export PATH="$PATH:/home/florian/.gem/bin"
export PATH="$PATH:./bin"
export GEM_HOME=~/.gem
export GEM_PATH=~/.gem

export BROWSER=chromium-browser

export HISTFILE=~/.zsh_history
export HISTSIZE=500000
export SAVEHIST=500000
eval `dircolors -b`

autoload -U promptinit
promptinit

prompt clint

PROMPT="%F{green}%~%F 
%F{yellow}%(?..[%?%1v] )%(2v.%U%2v%u.)
%f%B %#%b "

autoload -U compinit
compinit

autoload -U edit-command-line
zle -N edit-command-line

setopt histignorealldups
setopt autocd
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups
setopt extendedglob
setopt vi
setopt promptsubst
setopt globdots
setopt histreduceblanks
setopt histignorespace
setopt SH_WORD_SPLIT
setopt automenu
setopt cdablevars
setopt nohup
setopt listpacked
setopt nolisttypes
setopt completeinword
setopt alwaystoend
setopt correct

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "^xe" edit-command-line
bindkey "^x^e" edit-command-line

bindkey '^?' backward-delete-char
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey "^P" vi-up-line-or-history
bindkey "^N" vi-down-line-or-history
bindkey "^[[1~" vi-beginning-of-line   # Home
bindkey "^[[4~" vi-end-of-line         # End
bindkey '^[[5~' vi-backward-blank-word # Page Up
bindkey '^[[6~' vi-forward-blank-word  # Page Down

# TMUX
if [ -n $DISPLAY ]
then
    #if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux attach || tmux new-session)
fi

export EDITOR="vim"

for file in $HOME/.zsh/rc/*.rc; do
        source $file
done

. /usr/share/zsh/site-contrib/powerline.zsh

#Personnal alias

alias ll='ls -Al --color=auto -F'
alias ack-grep='ack'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gc='git commit'
alias gph='git push'
alias gpl='git pull'
alias gpr='git pull --rebase'
alias gco='git checkout'
alias sf='php app/console'

