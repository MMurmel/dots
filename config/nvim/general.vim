" ┌──────────────────┐
" │ general settings │
" └──────────────────┘

" basics
set nocompatible
filetype plugin indent on " filetype detection, autoloading of filetype plugins and indentation
set hidden " buffers are hidden not closed
set noshowmode " lightline shows modes so no need for default mode indicator
set title " change the terminal's title
set nowrap " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set showmatch " set show matching parenthesis
set visualbell " don't beep
set noerrorbells " don't beep
set splitbelow " horizontal splits will automatically be below
set splitright " vertical splits will automatically be to the right
set nomodeline " fixes modeline security issue
set encoding=utf8
set wildmode=longest,list   " get bash-like tab completions

" colorscheme
set termguicolors " use true colors
colorscheme gruvbox

" indentation
set tabstop=4 " tab is 4 spaces
set shiftwidth=4 " for autoindentation
set autoindent " always set autoindenting on
set smartindent " tries to infer indent by context

" numbers and sidelines
set number " always show line numbers
set relativenumber " show relative numbers

" searching and syntax highlighting
syntax enable
set ignorecase " ignore case when searching
set hlsearch " highlight search terms
set incsearch " show search matches as you type
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise

" spell checking
set spelllang=de,en_us
set spellfile=~/dotfiles/config/nvim/spell/custom.utf-8.add

" history & undos
set history=1000 " remember more commands and search history
set undolevels=1000 " use more undo levels

" timing
set updatetime=100
set timeoutlen=500 " timeout for leader key

" add snippets etc. of current course
set rtp+=~/current_course

" concealment for tex files
autocmd BufNewFile,BufRead *.tex set conceallevel=2
autocmd BufNewFile,BufRead *.tex setlocal spell
autocmd BufNewFile,BufRead *.tex setlocal iskeyword+=\
hi clear Conceal
