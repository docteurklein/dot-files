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
setopt emacs
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

export EDITOR="emacsclient -t"
export BROWSER=links
export TERM="rxvt-unicode-256color"
export VISUAL="emacsclient -t"

#Personnal alias

alias ll='ls -Al --color=auto -F'
