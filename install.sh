#!/bin/bash

APP_NAME='vegavim'
REQUIRE='npm node git'
[ -z "$VIM_PATH" ] && VIM_PATH="$HOME/.vegavim"
[ -z "$REPO_URL"] && REPO_URL="https://github.com/vegawong/vimSetting"

#help functions
msg() {
    printf '%b\n' "$1" >&2
}


success() {
    msg "\33[32m ✔ \33[0m ${1}${2}"
}

error() {
    msg "\33[31m ✘ \33[0m ${1}${2}"
    exit 1
}

warn() {
    msg "\33[33m ⚠ \33[0m ${1}${2}"
}

info() {
    msg "\33[32m ➜ \33[0m ${1}${2}"
}

lnif() {
    if [ ! -e $2 ] ; then
        ln -s $1 $2
    fi
}

#check if node & npm is installed
for i in $REQUIRE
do
    command -v $i >/dev/null && continue || { error "$i command not found.Please make sure you have $i installed" }
done

if [ ! -e "$VIM_PATH" ] ; then
    info "clone $APP_NAME into $VIM_PATH"
    mkdir -p "$VIM_PATH"
    git clone "$REPO_URL" "$VIM_PATH"
    ret="$?"
    success "Successfully cloned $APP_NAME"
else
    info "update $APP_NAME in $VIM_PATH"
    cd "$VIM_PATH" && git pull origin
    ret="$?"
    success "Successfully updated $APP_NAME"
fi

info "backing up current vim config"
today=`data +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc; do [ -e $i ] && [ -L $i ] && unlink $i; done
success "Successfully backed up your vim config"

info "setting up symlinks"
lnif $VIM_PATH/vimrc $HOME/.vimrc
lnif $VIM_PATH/ $HOME/.vim
# lnif $VIM_PATH/others/.tern-config $HOME/.tern-config
# lnif $VIM_PATH/others/editorconfig $HOME/.editorconfig
success "Successfully created symbol links"

#install vim-plug
if [ ! -e $VIM_PATH/autoload/vim-plug.vim ]; then
    info "Installing vim-plug"
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    success "Successfully installed vim-plug"
fi

info "install/update plugins via vim-plug"
system_shell=$SHELL
export SHELL="/bin/bash"
vim -u $VIM_PATH/vimrc +PlugInstall! +PlugClean +qall
export SHELL=$system_shell

#command -v eslint >/dev/null || warn "eslint is not found from global installation, you may want to run: npm i -g eslint"
#command -v jsctags >/dev/null || warn "for better javascript tags support, it's recommend to install jstags, npm i -g git+https://github.com/ramitos/jsctags.git"
#command -v js-beautify >/dev/null || warn "you may also want to install js-beautify, npm i js-beautify -g"
#
##vim undo dir
#if [ ! -d $HOME/.undodir ]
#then
#    mkdir -p $HOME/.undodir
#fi

success "$APP_NAME is successfully installed/updated!"
