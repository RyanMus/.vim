#!/bin/bash
brew install vim --with-lua --with-clipboard --override-system-vi
brew install   ack wget python ctags ag ranger tig 
# This config need lua installed for faster script excution
brew install lua 
brew install luajit
brew install php56 --with-pear &&  brew install php56-igbinary && pear install PHP_CodeSniffer-2.3.3
sudo pip install pylint virtualenvwrapper coverage pep8
cd ~ 
git clone git://github.com/codelife/.vim.git -b vimrc_mac
env GIT_SSL_NO_VERIFY=true git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s .vim/.vimrc ~/ 
#execute command bundleInstall in vim 
vim -c "BundleInstall"
 
