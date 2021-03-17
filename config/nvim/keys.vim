" === KEYMAPS ===

" Set ' ' (space) as leader key
let g:mapleader = " "
" source vimrc (for neovim its init.vim)
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
" clear search highlighting
nmap <silent> <leader>/ :nohlsearch<CR>

" navigation
" ctrl+l/a for moving text without moving cursor
noremap <C-l> <C-e>
noremap <C-a> <C-y>
" ctrl+e/i to redo/undo last jump and center line vertically
noremap <C-e> <C-i>zz
noremap <C-i> <C-o>zz
" move between splits
nmap <leader>l <C-w>k
nmap <leader>i <C-w>h
nmap <leader>a <C-w>j
nmap <leader>e <C-w>l
" Nerd Tree
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

" enable write to protected file without reopening it
cmap w!! w !sudo tee % >/dev/null
