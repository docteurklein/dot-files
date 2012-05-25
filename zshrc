export PATH="$PATH:/usr/bin/vendor_perl"
export BROWSER=chromium-browser

export HISTFILE=~/.zsh_history
export HISTSIZE=500000
export SAVEHIST=500000
eval `dircolors -b`

autoload -U promptinit
promptinit
prompt clint

autoload -U compinit
compinit

autoload -U edit-command-line
zle -N edit-command-line

setopt histignorealldups
setopt autocd
setopt autopushd pushdminus pushdsilent pushdtohome pushdignoredups
setopt pushdignoredups
setopt nohup
setopt extendedglob
setopt completeinword
setopt vi
setopt promptsubst
setopt globdots
setopt histreduceblanks
setopt histignorespace
setopt histignorealldups
setopt SH_WORD_SPLIT
setopt automenu
setopt cdablevars
setopt nohup
setopt listpacked
setopt nolisttypes
setopt extendedglob
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

export EDITOR="vim"

for file in $HOME/.zsh/rc/*.rc; do
        source $file
done

#Personnal alias

alias ll='ls -Al --color=auto -F'
alias ack-grep='ack'
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gco='git checkout'

