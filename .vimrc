

" Environment {
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }
    
    " Basics {
        set nocompatible        " 取消兼容vi，必须第一行
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    " Arrow Key Fix {
        " https://github.com/spf13/spf13-vim/issues/780
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }


    if has('python3')
        silent! python3 1
    endif
" }

" Use bundles config {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }

" General {
    set background=dark  " 设定黑色背景 

    filetype plugin indent on " 自动探测文件类型 
    syntax on  " 开启语法高亮

    set mouse=a " 支持vim内使用鼠标，避免鼠标滚动操作的是终端/vim容器，而不是vim内部

    " 系统粘贴和vim缓冲互通
    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

" }

" Fast Edit {

    inoremap <c-f> <Right> " 插入模式时光标右移
    inoremap <c-b> <Left> " 插入模式时光标左移

" 

" Vim UI {
    set number " Line numbers on
    set showmatch " Show matching brackets/parenthesis
    set incsearch " Find as you type search
    set hlsearch " Highlight search terms
    set ignorecase " Case insensitive search
    set smartcase " Case sensitive when uc present
    set backspace=indent,eol,start " Backspace for dummies
" }


" Formatting {
    set nowrap " Do not wrap long lines
    set smartindent " 设置自动缩进并智能根据{}等符号缩进
    set shiftwidth=4 " 层级缩进宽度4列/空格
    set expandtab  " 用空格代替制表符
    set softtabstop=4    " 4列宽代表一个混淆制表符
"}
