eval `dircolors -b`

stty -ixon

autoload -U +X bashcompinit && bashcompinit
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

autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey   "^[[A"    up-line-or-beginning-search
bindkey   "^[[B"    down-line-or-beginning-search

setopt histignorealldups
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
setopt inc_append_history

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

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# case-insensitive (uppercase from lowercase) completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# process completion
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{yellow}%d%f%u'

