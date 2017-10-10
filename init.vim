" ========================== Plug Setup ================================== {{{
" Install vim-plug if we don't already have it
let g:plugged_dir = '~/.local/share/nvim/plugged'

if has('win32')
  let g:plugged_dir = '~/AppData/Local/nvim/plugged'
  if empty(glob('$HOME/AppData/Local/nvim/autoload/plug.vim'))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir \%USERPROFILE\%\\AppData\\Local\\nvim\\plugged'
    execute '!mkdir \%USERPROFILE\%\\AppData\\Local\\nvim\\autoload'
    " Download the actual plugin manager
    execute '!curl -fkLo \%USERPROFILE\%\\AppData\\Local\\nvim\\autoload\\plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  endif
else
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    " Download the actual plugin manager
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  endif
endif
" }}}
" ============================ Plugins =================================== {{{
call plug#begin(g:plugged_dir)
Plug 'tpope/vim-repeat'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'galooshi/vim-import-js'
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
Plug 'tpope/tpope-vim-abolish'
call plug#end()
" }}}
" ============================ General =================================== {{{
set path+=src/**,frontend/**
set ttimeout
set ttimeoutlen=100
" }}}
" =========================== Shortcuts ================================== {{{
" Remap leader to '<Space>'
let g:mapleader='\<Space>'

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
inoremap jk <esc>

" Buffer keys
nmap <leader>N :enew<CR>              " To open a new empty buffer
nmap [b :bprevious<CR>                " Move to the previous buffer
nmap ]b :bnext<CR>                    " Move to the next buffer
nmap [B :bfirst<CR>                   " Move to the first buffer
nmap ]B :blast<CR>                    " Move to the last buffer
nmap <Leader>bo :w <BAR> %bd <BAR> e#<CR> " Close all but open buffer

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR> " Show all open buffers and their status

" Quickfix/loclist mapping
nmap [q :cprevious<CR>                " Move to the previous quickfix
nmap ]q :cnext<CR>                    " Move to the next quickfix
nmap [Q :cfirst<CR>                   " Move to the first quickfix
nmap ]Q :clast<CR>                    " Move to the last quickfix
nmap [l :lprevious<CR>                " Move to the previous loclist
nmap ]l :lnext<CR>                    " Move to the next loclist
nmap [L :lfirst<CR>                   " Move to the first loclist
nmap ]L :llast<CR>                    " Move to the last loclist

" Tabs mapping
nmap <leader>T :tabnew<CR>            " Open new tab
nmap <leader>tq :tabclose<CR>         " Close tab
nmap [t :tabprevious<CR>              " Move to the previous quickfix
nmap ]t :tabnext<CR>                  " Move to the next quickfix
nmap [T :tabfirst<CR>                 " Move to the first quickfix
nmap ]T :tablast<CR>                  " Move to the last quickfix

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Quick save
noremap <Leader>w :update<CR>

" Autoformat
nnoremap <F2> :Neoformat<CR>
vnoremap <F2> :'<,'>Neoformat<CR>
" }}}
" ======================== Visual settings =============================== {{{
set cursorline
set number
augroup highlight_follows_focus
  autocmd!
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
  autocmd WinEnter * set relativenumber
  autocmd WinLeave * set norelativenumber
augroup END

augroup highligh_follows_vim
  autocmd!
  autocmd FocusGained * set cursorline
  autocmd FocusLost * set nocursorline
  autocmd FocusGained * set relativenumber
  autocmd FocusLost * set norelativenumber
augroup END

set foldmethod=syntax
set foldlevelstart=3

set wildignorecase

" Always use vertical diffs
set diffopt+=vertical

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set list

set termguicolors
let g:enable_bold_font=1
let g:enable_italic_font=1
set background=dark
" colorscheme angr
colorscheme gotham
" colorscheme rakr
" colorscheme PaperColor
" }}}
" ============================ Editing =================================== {{{
set expandtab
set shiftwidth=2
set softtabstop=2
set showmatch

" Use prettier for formating javascript
let g:neoformat_enabled_javascript = ['prettier']

" Emmet settings
let g:user_emmet_leader_key = '<Tab>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
" }}}
" ======================== Linter settings =============================== {{{
" Ale config
let g:ale_linters = {'javascript': ['eslint']}
if !exists('g:ale_fixers')
  let g:ale_fixers = {}
endif
let g:ale_fixers.javascript = ['eslint']
let g:ale_fix_on_save = 1
" }}}
" =========================== Searching ================================== {{{
set ignorecase
set smartcase

" Setup rg(ripgrep) / ag (the_silver_searcher)
if executable('rg')
  set grepprg=rg\ -S\ --vimgrep\ --color=never
elseif executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
" }}}
" ======================== Writing plugins =============================== {{{
let g:vimwiki_folding = 'syntax'
" }}}
" vim:foldenable:foldmethod=marker
