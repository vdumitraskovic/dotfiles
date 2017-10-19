" ======================= Global variables================================ {{{
let g:nvim_base = '~/.local/share/nvim/'
if has('win32')
  let g:nvim_base = '~/AppData/Local/nvim/'
endif
let g:goyo_on = 0
" }}}
" ========================== Plug Setup ================================== {{{
" Install vim-plug if we don't already have it
if has('win32')
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
call plug#begin(g:nvim_base . 'plugged')
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
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'cohama/lexima.vim'
Plug 'romainl/vim-qlist'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'reedes/vim-pencil'
Plug 'othree/javascript-libraries-syntax.vim'
call plug#end()
" }}}
" ============================ General =================================== {{{
set ttimeout
set ttimeoutlen=100
" }}}
" ======================= Files and folders=============================== {{{
set fileformats=unix,dos
set path+=src,src/**,frontend,frontend/**
set undofile
exec 'set undodir=' . g:nvim_base . 'undodir'

" Netrw config
let g:netrw_banner=0
let g:netrw_browse_split=4
" let g:netrw_altv=1
let g:netrw_liststyle=0
let g:netrw_winsize = 25
" }}}
" =========================== Shortcuts ================================== {{{
" Remap leader to '<Space>'
let g:mapleader="\<Space>"

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
inoremap jk <esc>

" Buffer keys
nmap <leader>N :enew<CR>              " To open a new empty buffer
nmap [b :bprevious<CR>                " Move to the previous buffer
nmap ]b :bnext<CR>                    " Move to the next buffer
nmap [B :bfirst<CR>                   " Move to the first buffer
nmap ]B :blast<CR>                    " Move to the last buffer
" Close all buffers but open one
nmap <leader>bo :silent w <BAR> %bd <BAR> e#<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
nnoremap <leader>bl :b <C-d>

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

" Find file
noremap <C-p> :find<Space>

" Open netrw
noremap <C-n> :Lexplore!<CR>
" Open netrw for opened file
noremap g<C-n> :Lexplore! %:p:h<CR>

" Autoformat
nnoremap <F2> :Neoformat<CR>
vnoremap <F2> :'<,'>Neoformat<CR>

set pastetoggle=<F3>

" Goyo
nnoremap <F11> :Goyo<CR>

" Quick close help
noremap <S-F1> :helpclose<CR>

" Show javascript methods and functions
nnoremap <F8> :Ilist ^\( *\zs\)\(\w*(\(\w\\<BAR> \\<BAR>,\)*) {\\<BAR>.*const \w*.* => \)<CR>

" Show git status
nnoremap <F9> :Gstatus<CR>
" }}}
" ======================== Visual settings =============================== {{{
set cursorline
set number

function! s:focus_enter()
  if g:goyo_on
    return
  endif
  set cursorline
  set relativenumber
endfunction
function! s:focus_leave()
  set nocursorline
  set norelativenumber
endfunction

augroup EditorFocus
  autocmd! WinEnter * call <SID>focus_enter()
  autocmd! WinLeave * call <SID>focus_leave()
  autocmd! FocusGained * call <SID>focus_enter()
  autocmd! FocusLost * call <SID>focus_leave()
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
" colorscheme gotham
" colorscheme rakr
" colorscheme PaperColor
" colorscheme hybrid_material
colorscheme gruvbox
set fillchars+=vert:\│
" }}}
" ============================ Editing =================================== {{{
set expandtab
set shiftwidth=2
set softtabstop=2
set showmatch

" Use prettier for formating javascript
let g:neoformat_enabled_javascript = ['prettier']

" Emmet settings
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

" Completion
set complete=.,w,b,u,t,i,d
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

" Goyo + Limelight
function! s:goyo_enter()
  Limelight
  set nonumber
  set noshowmode
  set noshowcmd
  let g:goyo_on = 1
  call <SID>focus_leave()
endfunction

function! s:goyo_leave()
  Limelight!
  set number
  set showmode
  set showcmd
  let g:goyo_on = 0
  call <SID>focus_enter()
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
  autocmd FileType vimwiki      call pencil#init({'autoformat': 0})
augroup END
" }}}
" =========================== Snippets ================================== {{{
" Enable es6 snippets for javascript by default
autocmd FileType javascript UltiSnipsAddFiletypes javascript-es6
" Enable jsx snippets
autocmd FileType javascript.jsx UltiSnipsAddFiletypes javascript-react
"
" }}}
" ========================== Javascript ================================= {{{
let g:used_javascript_libs = 'underscore,react,ramda'
" }}}
" vim:foldenable:foldmethod=marker
