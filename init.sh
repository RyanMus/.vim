#!/bin/bash
git config --global http.sslVerify false
yum install  -y ack python-pep8 cscope python-devel
version=`vim  --version |head -1 |awk '{print $5}' |tr -d [[:alpha:]]`
#if vim version little than 7.3 install the lastest version
if [ $version -lt 7.3 ]; then
    echo "install newest vim"
    wget https://github.com/b4winckler/vim/archive/master.zip -O vim_newest.zip
    unzip vim_newest.zip
    cd vim-master/src
./configure --prefix=/usr/local --enable-multibyte --with-features=big --disable-selinux --enable-pythoninterp --with-python-config-dir=`which python-config`  --enable-gui=no  
if [ $? -eq 0 ];then
   
    echo "vim has been  installed in /usr/local/bin/vim  success"
    if [ `which vim` != "/usr/local/bin/vim" ];then
        mv /usr/bin/vim{,.bak}
        ln -s /usr/local/bin/vim /usr/bin/vim
else
    echo "vim install fail"

fi
cd ~
day=`date +%m%d`
mv .vim{,.bak.$day}
mv .vimrc{,.bak.$day}
git clone git://github.com/codelife/.vim.git  
ln -s .vim/.vimrc 
env GIT_SSL_NO_VERIFY=true git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim -c "BundleInstall"
#execute command bundleInstall! in vim 

