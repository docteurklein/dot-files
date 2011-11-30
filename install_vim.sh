#!/bin/sh

cd /opt && \
hg clone https://vim.googlecode.com/hg/ vim && \
cd vim/src && \
./configure \
    --enable-multibyte \
    --enable-fontset \
    --enable-rubyinterp \
    --enable-pythoninterp \
&& \
make && \
sudo make install
