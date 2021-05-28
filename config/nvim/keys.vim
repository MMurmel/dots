" ┌─────────────┐
" │ keybindings │
" └─────────────┘

" Set ' ' (space) as leader key
let g:mapleader = " "

" source vimrc (for neovim its init.vim)
nnoremap <silent> <leader>r :so $MYVIMRC<CR>

" clear search highlighting
nmap <silent> <leader>/ :nohlsearch<CR>

" navigation
" ctrl+l/a for moving text without moving cursor
noremap <C-a> <C-e>
noremap <C-l> <C-y>
" ctrl+e/i to redo/undo last jump and center line vertically
noremap <C-e> <C-i>zz
noremap <C-i> <C-o>zz
" splits
nnoremap <silent> <leader>s :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>
" move between splits
nmap <leader>l <C-w>k
nmap <leader>i <C-w>h
nmap <leader>a <C-w>j
nmap <leader>e <C-w>l

" Nerd Tree
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'

" enable write to protected file without reopening it
cmap w!! w !sudo tee % >/dev/null

" VIMTEX
nmap <leader>xx <plug>(vimtex-compile)
nmap <leader>xv <plug>(vimtex-view)
nmap <leader>xc <plug>(vimtex-clean)

" ULTISnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Spellchecking
" toggle spell check
nnoremap <F8> :setlocal spell!<CR>
" correct last spelling mistake
inoremap <C-s> <c-g>u<Esc>[s1z=`]a<c-g>u
