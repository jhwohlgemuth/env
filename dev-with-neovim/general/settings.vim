set autoindent
set autoread
set background=dark
set cmdheight=1
set cursorline
set encoding=UTF-8
set expandtab " Convert tabs to spaces
set hidden " TextEdit might fail if hidden is not set
set nobackup
set nocompatible
set noswapfile
set nowrap
set nowritebackup
set number
set ruler
set shortmess+=c " Don't pass messages to |ins-completion-menu|
set smartindent
set smarttab
set termguicolors
set timeoutlen=100
set undodir=~/AppData/Local/nvim/undo
set undofile " Maintain undo history between sessions
set updatetime=100 " Default is 4000ms
syntax on
syntax enable
filetype plugin indent on
set foldmethod=indent

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" {{ Keymappings }}
let g:mapleader = "\<Space>"
nnoremap <silent> <C-s> :w<CR>
" use <CR> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" Exit terminal with Escape
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <C-Bslash> :CocCommand explorer --toggle<CR>
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
" map <C-f> :Files<CR>
" map <leader>b :Buffers<CR>
" nnoremap <leader>g :Rg<CR>
" nnoremap <leader>t :Tags<CR>
" nnoremap <leader>m :Marks<CR>