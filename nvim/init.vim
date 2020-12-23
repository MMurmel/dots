if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
set number
set relativenumber
set updatetime=100


" === PLUGINS ===

call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'arcticicestudio/nord-vim'
call plug#end()


" === THEME ===

colorscheme nord
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_bold_vertical_split_line = 1

let g:lightline = {
  \   'colorscheme': 'nord',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': '%3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }

let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}

let g:lightline.subseparator = {
	\   'left': '', 'right': '' 
  \}


"=== KEYBINDINGS ===

map <C-n> :NERDTreeToggle<CR>


" === NERD TREE configs ===

" automatically start NERDTree on opening vim without file specification
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * wincmd p

" automatically close NERDTree if it is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:NERDTreeGitStatusMapCustom = {
    \ "Modified"  : "~",
    \ "Staged"    : "+",
    \ "Untracked" : "*",
    \ "Renamed"   : "→",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "ø",
    \ "Dirty"     : "~",
    \ "Clean"     : "«»",
    \ 'Ignored'   : "¬",
    \ "Unknown"   : "?"
    \ }
