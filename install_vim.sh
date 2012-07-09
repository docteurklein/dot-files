#!/bin/sh

cd /opt && \
git clone https://github.com/b4winckler/vim.git
cd vim/src && \
make clean && \
make distclean && \
./configure \
    --enable-multibyte         \
    --enable-fontset           \
    --enable-rubyinterp=yes    \
    --enable-pythoninterp=yes  \
    --with-python-config-dir=/usr/bin/python2.7-config  \
    --enable-python3interp=yes \
    --enable-gui=gtk2          \
&& \
make && \
sudo make install
