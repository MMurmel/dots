" lightline colorscheme must be done first 
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

" true color suppor and colorscheme
set termguicolors
colorscheme onedark
syntax on
" lightline shows modes so no need for default mode indicator
set noshowmode
