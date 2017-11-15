
" set the default leader key
let mapleader = "`"

" add bundle setting file
" if filereadable(expand("~/.vimrc.bundles"))
source ~/.vimrc.bundles
" endif

" show line-number
set nu


" map key for easymotion plug
nmap s <Plug>(easymotion-s2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
