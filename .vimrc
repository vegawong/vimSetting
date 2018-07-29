

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

    let mapleader=','
    let g:mapleader=','
    let s:vim8 = has('patch-8.0.0039') && exists('*job_start')

    " vim配置保存自动生效
    autocmd! BufWritePost *.vimrc* so %

" }

" Use bundles config {
    if filereadable(expand("~/.vim/.vimrc.bundles"))
        source ~/.vim/.vimrc.bundles
    endif
" }

" General {
    filetype plugin indent on " 自动探测文件类型 
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

    " 保存
    nmap <leader>w :w<CR>

    " 插入模式光标右移动
    inoremap <c-f> <Right>
    " 插入模式光标左移动
    inoremap <c-b> <Left>

    " buffer快速切换
    nmap <leader>1 :1b<CR>
    nmap <leader>2 :2b<CR>
    nmap <leader>3 :3b<CR>
    nmap <leader>4 :4b<CR>
    nmap <leader>5 :5b<CR>
    nmap <leader>6 :6b<CR>
    nmap <leader>7 :7b<CR>
    nmap <leader>8 :8b<CR>
    nmap <leader>9 :9b<CR>
    nmap <leader>0 :10b<CR>

    " 复制选择内容到系统剪切板
    map <leader>y "+y
    " 复制当前行的内容到系统剪切板
    map <leader>yy "+yy
    " 将系统剪切板里面的内容粘贴到当前光标
    nmap <leader>p "+p
    nmap <leader>WQ :wa<CR>:q<CR>
    

" 

" Vim UI {
    set number " Line numbers on
    set showmatch " Show matching brackets/parenthesis
    set incsearch " Find as you type search
    set hlsearch " Highlight search terms
    set ignorecase " Case insensitive search
    set smartcase " Case sensitive when uc present
    set backspace=indent,eol,start " Backspace for dummies
    set cursorline
    syntax on
    set background=dark
    colorscheme onedark
" }


" Formatting {
    set nowrap " Do not wrap long lines
    set smartindent " 设置自动缩进并智能根据{}等符号缩进
    set shiftwidth=4 " 层级缩进宽度4列/空格
    set expandtab  " 用空格代替制表符
    set softtabstop=4    " 4列宽代表一个混淆制表符
"}

