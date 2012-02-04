#!/bin/sh

cd /opt && \
git clone https://github.com/b4winckler/vim.git
cd vim/src && \
./configure \
    --enable-multibyte    \
    --enable-fontset      \
    --enable-rubyinterp   \
    --enable-pythoninterp \
    --enable-gui=gtk2     \
&& \
make && \
sudo make install
