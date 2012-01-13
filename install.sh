#!/bin/sh

ln -s dot-files/Xdefaults     ../.Xdefaults
ln -s dot-files/xinitrc       ../.xinitrc

ln -s dot-files/vim           ../.vim
ln -s dot-files/vimrc         ../.vimrc

ln -s dot-files/tmux.conf     ../.tmux.conf
ln -s dot-files/tmux.rc       ../tmux.rc

ln -s dot-files/gitconfig     ../.gitconfig
ln -s dot-files/gitignore     ../.gitignore
ln -s dot-files/git_template  ../.git_template

ln -s dot-files/ctags         ../.ctags

ln -s dot-files/toprc         ../.toprc

ln -s dot-files/zsh           ../.zsh
ln -s dot-files/zshrc         ../.zshrc

sudo ln -s ~/dot-files/lighttpd/conf.d           /etc/lighttpd/conf.d
sudo ln -s ~/dot-files/lighttpd/lighttpd.conf    /etc/lighttpd/lighttpd.conf
