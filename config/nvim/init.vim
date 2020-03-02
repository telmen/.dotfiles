" Plugins  {{{1
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'markonm/traces.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'mattn/emmet-vim'
Plug 'ternjs/tern_for_vim'
Plug 'arcticicestudio/nord-vim'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'


call plug#end()

" Setup {{{1
set nocompatible

syntax enable
colo nord
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
hi Search cterm=NONE ctermfg=black ctermbg=grey
hi Visual cterm=NONE ctermfg=black ctermbg=grey
hi ExtraWhitespace guibg=#bd5353 ctermbg=131

" Options {{{1
set ai
set autoread
set backspace=indent,eol,start
set clipboard=unnamedplus
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
set list
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
set omnifunc=syntaxcomplete#Complete
set relativenumber
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
set updatetime=300
set wildcharm=<C-z>
set wildignorecase
set wildmenu
let mapleader = ","
let localmapleader = ","

" GUI options {{{
if has("gui_running")
  set guioptions-=T
  set guioptions-=r
  set guioptions-=R
  set guioptions-=m
  set guioptions-=l
  set guioptions-=L
  set guitablabel=%t
endif
" Commands {{{1
command! W w !sudo tee % &>/dev/null
command! Vimr source ~/.config/nvim/init.vim
command! Vime e ~/.config/nvim/init.vim

" Mappings {{{1
nnoremap k gk
nnoremap j gj
nnoremap gp `[v`]
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
vnoremap <C-s> :w<CR>
nnoremap K :tabn<CR>
nnoremap J :tabp<CR>
nnoremap <Leader>/ :noh<CR>
nnoremap <Leader>` :b#<CR>
noremap <Leader>n :set number!<CR>
noremap <Leader>w :bd<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
map [b :bprevious<CR>
map ]b :bnext<CR>
inoremap <C-y> <Esc>:sil exe ".!which <cWORD>" <bar> s/^/#!/ <bar> filetype detect<cr>YpDi
vnoremap & :s<CR>
noremap H ^
noremap L g_
vnoremap <C-c> "+ygv"*y
nnoremap <C-t> :tabnew<cr>
nnoremap <RightMouse> "+]p
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>
nnoremap Q :qa!<cr>

" Plugin Options  {{{1
function! s:build_quickfix_list(lines)
call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
copen
cc
Plug 'bagrat/vim-buffet'
endfunction

let g:netrw_liststyle = 3
let g:ale_set_highlights = 0
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {
    \ 'python': ['black', 'isort'],
    \ 'javascript': ['prettier', 'eslint'],
    \ 'json': ['prettier'],
    \ 'html': ['prettier'],
    \ 'css': ['prettier'],
    \}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:fzf_action = {
\ 'ctrl-q': function('s:build_quickfix_list'),
\ 'ctrl-t': 'tab split',
\ 'ctrl-x': 'split',
\ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Plugin mappings {{{2
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
if has('patch8.1.1068')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> gk :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>rn <Plug>(coc-rename)
augroup Coc
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType javascript,typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <C-p> :Files<CR>
nnoremap <Leader>f :Rg<CR>
nnoremap <Leader>b :Buffers<CR>
nmap <F6> <Plug>(ale_fix)
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>
" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>
nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

" Plugin commands {{{2

command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Format :call CocAction('format')

function! MyUniq(lst)
    return filter(a:lst, 'count(a:lst, v:val) == 1')
endfunction
command! -bang Netrwhist call fzf#run(fzf#wrap('netrw_dirhist',
    \ {'source': 
    \ !exists('g:netrw_dirhist_cnt')
    \   ?"tail -n +3 ".g:netrw_home.".netrwhist | cut -d \"'\" -f2- | rev | cut -d \"'\" -f2- | rev | awk '!seen[$0]++'"
    \   :MyUniq(map(range(1,g:netrw_dirhist_cnt), 'g:netrw_dirhist_{v:val}'))
    \ }, <bang>0))

command! -bang -complete=dir -nargs=* LS
    \ call fzf#run(fzf#wrap('ls', {'source': 'ls', 'dir': <q-args>}, <bang>0))

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'sink': 'tabedit', 'options': ['--layout=reverse', '--info=inline']}), <bang>0)

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" Leaders {{{1
inoremap <leader>d <C-r>=strftime('%D %l:%M%P')<cr>
inoremap <leader>D <C-r>=strftime('%D')<cr>
" }}} :vim fdm=marker
