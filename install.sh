#!/bin/bash
#this is line from branch c
brew install ack wget python ctags ag ranger tig 
brew install lua 
brew install luajit
brew install php56 --with-pear &&  brew install php56-igbinary && pear install PHP_CodeSniffer-2.3.3
git clone https://github.com/vim/vim.git &&  cd vim 
 ./configure --with-features=huge --enable-rubyinterp     --enable-pythoninterp --enable-luainterp=yes --with-lua-prefix=/usr/local/Cellar/lua/5.2.4_1   --enable-perlinterp     --enable-multibyte --enable-sniff  --enable-fontset --enable-cscope     --disable-gui 
sudo pip install pylint virtualenvwrapper coverage pep8
cd ~ 
git clone git://github.com/codelife/.vim.git -b vimrc_mac
env GIT_SSL_NO_VERIFY=true git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s .vim/.vimrc ~/ 
#execute command bundleInstall in vim 
vim -c "BundleInstall"
