#!/bin/bash
yum install  -y ack python-pep8 cscope python-devel
git config --global http.sslVerify false
env GIT_SSL_NO_VERIFY=true git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
#execute command bundleInstall! in vim 
