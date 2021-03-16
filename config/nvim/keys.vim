" === KEYMAPS ===
" Set ' ' (space) as leader key
let g:mapleader = " "
" source vimrc (for neovim its init.vim)
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
" clear search highlighting
nmap <silent> <leader>/ :nohlsearch<CR>
" Nerd Tree stuff
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

" enable write to protected file without reopening it
cmap w!! w !sudo tee % >/dev/null
