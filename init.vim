" ========================== Plug Setup ================================== {{{
" Install vim-plug if we don't already have it
let g:plugged_dir = '~/.local/share/nvim/plugged'

if has('win32')
  let g:plugged_dir = '~/AppData/Local/nvim/plugged'
  if empty(glob("$HOME/AppData/Local/nvim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute '!mkdir \%USERPROFILE\%\\AppData\\Local\\nvim\\plugged'
    execute '!mkdir \%USERPROFILE\%\\AppData\\Local\\nvim\\autoload'
    " Download the actual plugin manager
    execute '!curl -fkLo \%USERPROFILE\%\\AppData\\Local\\nvim\\autoload\\plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  endif
else
  if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    " Download the actual plugin manager
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  endif
endif
" }}}
" ============================ Plugins =================================== {{{
call plug#begin(plugged_dir)
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()
" }}}
" ============================ General =================================== {{{
set path+=src/**,frontend/**
let mapleader="\<Space>"
" }}}
" =========================== Shortcuts ================================== {{{
" Remap leader to '<Space>'
let mapleader="\<Space>"

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
inoremap jk <esc>

" Buffer keys
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Quick save
noremap <Leader>w :update<CR>

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

set termguicolors
let g:enable_bold_font=1
let g:enable_italic_font=1
set background=dark
" colorscheme angr
colorscheme gotham256
" colorscheme rakr
" colorscheme PaperColor
" }}}
" ============================ Editing =================================== {{{
set expandtab
set shiftwidth=2
set softtabstop=2
" }}}
" ======================== Linter settings =============================== {{{
" Ale config
let g:ale_linters = {'javascript': ['eslint']}
if !exists('g:ale_fixers')
  let g:ale_fixers = {}
endif
let g:ale_fixers.javascript = ['eslint']

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
" }}}
" =========================== Searching ================================== {{{
" Setup rg(ripgrep) / ag (the_silver_searcher)
if executable('rg')
  set grepprg=rg\ --vimgrep\ --color=never
elseif executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
" }}}
" vim:foldenable:foldmethod=marker
