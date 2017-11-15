#!/bin/bash
rm -rf $HOME/.vim*
chmod -R 777 .vim*
ln -s $PWD/.vim $HOME/.vim
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.vimrc.bundles $HOME/.vimrc.bundles

# 重新安装vundle
rm -rf $HOME/.vim/bundle/vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ls -al $HOME | grep vim
echo "vim setup success"