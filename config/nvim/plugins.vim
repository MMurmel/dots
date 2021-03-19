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
" interface/UI, multiple color schemes
" so I can swap whenever I feel like it
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
call plug#end()

" === VIMTEX ===
let g:vimtex_mappings_enabled=0

" === LIGHTLINE config ===
let g:lightline = {
  \   'colorscheme': 'onedark',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]]},
  \   'component': {'lineinfo': '%3l:%-2v'},
  \   'component_function': {'gitbranch': 'fugitive#head'},
  \   'separator':{'left': '', 'right': ''},
  \   'subseparator':{'left': '', 'right': ''},
  \ }

" === NERD TREE configs ===
" automatically start NERDTree on opening vim without file specification
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" automatically close NERDTree if it is the last window
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeGitStatusUseNerdFonts = 1

