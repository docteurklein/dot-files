source $HOME/.envvars

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

autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey   "^[[A"    up-line-or-beginning-search
bindkey   "^[[B"    down-line-or-beginning-search

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

for file in $HOME/.zsh/rc/*.rc; do
        source $file
done

if [ -f /usr/share/zsh/site-contrib/powerline.zsh ]
then
    . /usr/share/zsh/site-contrib/powerline.zsh
fi

if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]
then
    . ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi

source $HOME/.aliases

# added by travis gem
[ -f /home/florian/.travis/travis.sh ] && source /home/florian/.travis/travis.sh
