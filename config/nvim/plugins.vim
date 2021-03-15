" Check if vim-plug is installed 
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" === PLUGINS ===
call plug#begin()
" essentials
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" language specific
Plug 'lervag/vimtex'
" interface/UI
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
call plug#end()

" === NERD TREE configs ===
" automatically start NERDTree on opening vim without file specification
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" automatically close NERDTree if it is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeGitStatusUseNerdFonts = 1

