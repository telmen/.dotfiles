set nocompatible

syntax enable
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set conceallevel=3
set ai
set autoread
set backspace=indent,eol,start
set cmdheight=2
set encoding=utf-8
set expandtab
set fdm=marker
set hidden
set hlsearch
set ic
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set nobackup
set noequalalways
set nohlsearch
set noruler
set noshowmode
set novisualbell
set nowrap
set nowritebackup
set number
set ruler
set shiftround
set shortmess+=c
set showcmd
set showmatch
set signcolumn=yes
set smartcase
set smartindent
set splitbelow
set splitright
set sts=2 ts=2 sw=2
set timeoutlen=600
set updatetime=100
set wildcharm=<C-z>
set wildignorecase
set wildmenu
set nolist
nnoremap <SPACE> <Nop>
let mapleader = " "
let localmapleader = " "

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
command! W w !sudo tee % &>/dev/null
command! Vimr source ~/.vimrc
command! Vime e ~/.vimrc

nmap sh :split<CR><C-w>w
nmap s\ :vsplit<CR><C-w>w
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l
map so <C-w>o
map sc <C-w>c
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-
nnoremap k gk
nnoremap j gj
nnoremap gp `[v`]
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
vnoremap <C-s> :w<CR>
map [b :bprevious<CR>
map ]b :bnext<CR>
nnoremap <Leader>/ :noh<CR>
nnoremap <Leader>` :b#<CR>
noremap <Leader>n :set number!<CR>
noremap <Leader>w :bd<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
inoremap <C-y> <Esc>:sil exe ".!which <cWORD>" <bar> s/^/#!/ <bar> filetype detect<cr>YpDi
vnoremap & :s<CR>
noremap H ^
noremap L g_
vnoremap <C-c> "+ygv"*y
nnoremap <RightMouse> "+]p
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
nnoremap Q :qa!<cr>

