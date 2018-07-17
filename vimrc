"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vimSetting
"
" -- vega
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

" Load Plugins
if filereadable(expand("~/.vim/vimrc.before"))
	source ~/.vim/vimrc.before
endif

" Load Plugins
if filereadable(expand("~/.vim/vimrc.bundles"))
	source ~/.vim/vimrc.bundles
endif

filetype plugin indent on
syntax enable
syntax on

"colorscheme gruvbox
colorscheme solarized
"colorscheme molokai
"colorscheme desert

set background=dark
set t_Co=256
set history=200 "history: number of command-lines remembered
set autoread	" auto reload file after being modified
set shortmess=atI	" do not show initial page
set nobackup
set noswapfile
set cursorcolumn " highlight current column
set cursorline   " highlight current line
set t_ti= t_te=  " alway show the content on the screen after exist VIM
set selection=inclusive     	" set selection=exclusive
set selectmode=mouse,key
set title
set novisualbell
set noerrorbells
set t_vb=
set tm=500
set nostartofline	"keep cursor position when swiching between buffers


set number
set nowrap

