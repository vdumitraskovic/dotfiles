" ======================= Global variables================================ {{{
let g:nvim_base = '~/.local/share/nvim/'
execute 'set runtimepath+=' . expand(g:nvim_base)
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
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'
Plug 'galooshi/vim-import-js'
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
Plug 'tpope/tpope-vim-abolish'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plug 'cohama/lexima.vim'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'reedes/vim-pencil'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'justinmk/vim-sneak'
Plug 'mtth/scratch.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'PeterRincker/vim-argumentative'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdtree'
Plug 'metakirby5/codi.vim'
Plug 'amadeus/vim-mjml'
Plug 'roxma/nvim-completion-manager'
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
set backupcopy=yes
exec 'set undodir=' . g:nvim_base . 'undodir'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Specify files to ignore on wildmenu
set wildignore+=.git
set wildignore+=node_modules,bower_components
set wildignore+=dist

" Disable NetRW
let loaded_netrwPlugin = 1
let NERDTreeWinPos = 'right'
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
nmap <leader>bo :silent w <BAR> :silent %bd <BAR> e#<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" nnoremap <leader>bl :b <C-d>
" nnoremap <leader>bl :CtrlPBuffer<CR>
nnoremap <leader>bl :Buffers<CR>

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

" Tags search
nnoremap <leader>tl :CtrlPTag<CR>

" Text object motions
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" Replace word undercursor in whole line
nnoremap <Leader>r :.s/\<<C-r><C-W>\>//g<Left><Left>

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Quick save
noremap <Leader>s :update<CR>

" Find file
" noremap <C-p> :find<Space>
let g:ctrlp_map = ''
noremap <C-p> :Files<CR>

" Open NERDTree for opened file
noremap g<C-n> :NERDTreeFind<cr>

" Create new file if doesn't exist
function! s:create_file(filename)
  let s:prefix=''
  let s:ext=''
  if (&ft == 'scss')
    let s:prefix = '_'
    let s:ext = '.scss'
  endif
  exec "edit " . expand('%:p:h') . '/' . fnamemodify(a:filename, ':h') .
  \  '/' . s:prefix . fnamemodify(a:filename, ':t') . s:ext
endfunction

map <Leader>gf :call <SID>create_file(expand('<cfile>'))<cr>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Autoformat
nnoremap <F2> :Neoformat<CR>
vnoremap <F2> :'<,'>Neoformat<CR>

set pastetoggle=<F3>

" Goyo
nnoremap <F11> :Goyo<CR>

" Quick close help
noremap <S-F1> :helpclose<CR>

" Open tagbar
nmap <F8> :TagbarToggle<CR>

" Show git status
nnoremap <F9> :Gstatus<CR>

" Close loclists and quicfix
nnoremap <F12> :windo lcl\|ccl<CR>
nnoremap <F7> :silent execute 'grep -w ' . expand('<cword>')<CR> <BAR> :redraw!<CR>

" Don't load Scratch window mappings
let g:scratch_no_mappings = 1
" }}}
" ======================== Visual settings =============================== {{{
set lazyredraw
set cursorline
set number
set relativenumber

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

" Auto open quickfix
autocmd QuickFixCmdPost [^l]* nested cwindow

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set list

let g:gitgutter_override_sign_column_highlight = 1

set termguicolors
let g:enable_bold_font=1
let g:enable_italic_font=1
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:onedark_terminal_italics = 1
let g:gruvbox_bold      = 1
let g:gruvbox_italic    = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
set background=light
" set background=dark
" colorscheme dracula
" colorscheme flatcolor
" colorscheme gruvbox
" colorscheme PaperColor
" colorscheme OceanicNext
colorscheme solarized8
" colorscheme carbonized-light
set fillchars+=vert:\│
" }}}
" ============================ Editing =================================== {{{
set expandtab
set shiftwidth=2
set softtabstop=2
set showmatch

" Use system clipboard
set clipboard+=unnamed

" Use prettier for formating javascript
let g:neoformat_enabled_javascript = ['prettier']

" Emmet settings
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\      'filters': 'html, bem',
\      'bem': {
\          'elementSeparator': '__',
\          'modifierSeparator': '--',
\          'shortElementPrefix': '-'
\      }
\  },
\  'html': {
\      'filters': 'html, bem'
\  },
\}

" Use relative path for filename completion
inoremap <C-X><C-F> <C-O>:lcd %:p:h<CR><C-X><C-F>

" Vim-wordmotion config
let g:wordmotion_prefix = '<Leader>'

" Delimate config
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
" }}}
" ======================== Linter settings =============================== {{{
" Ale config
let g:ale_linters = {'javascript': ['eslint']}
if !exists('g:ale_fixers')
  let g:ale_fixers = {}
endif
let g:ale_fixers.javascript = ['eslint']
let g:ale_fix_on_save = 1
let g:ale_change_sign_column_color = 0
" }}}
" =========================== Searching ================================== {{{
set ignorecase
set smartcase

" Setup rg(ripgrep) / ag (the_silver_searcher)
if executable('rg')
  set grepprg=rg\ -S\ --vimgrep\ --color=never
  let g:ctrlp_user_command = ['.git', 'rg %s --files --color=never', 'rg %s --files --no-ignore']
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Disable changing of cwd when changing dir
let g:ctrlp_working_path_mode = '0'

autocmd! FileType fzf setlocal noshowmode

" Sneak setup
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
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
" =========================== Snippets =================================== {{{
let g:UltiSnipsSnippetsDir = g:nvim_base . 'UltiSnips'
" Enable es6 snippets for javascript by default
autocmd FileType javascript UltiSnipsAddFiletypes javascript-es6
" Enable jsx snippets
autocmd FileType javascript.jsx UltiSnipsAddFiletypes javascript-react
" }}}
" ========================== Javascript ================================== {{{
autocmd FileType javascript setlocal include=from[\ ]

" Javascript lib syntax setup
let g:used_javascript_libs = 'underscore,react,ramda'
"
" Tagbar setup
let g:tagbar_type_javascript = {
    \ 'ctagsbin': 'ctags',
    \ 'kinds' : [
        \ 'v:global variables',
        \ 'f:functions',
        \ '?:unknown',
        \ 'C:constants',
        \ 'c:classes',
        \ 'm:methods',
        \ 'p:properties',
        \ 'g:generators',
    \ ],
\ }
" }}}
" ============================= SCSS ===================================== {{{
autocmd FileType scss setlocal sw=4
" }}}
" ============================= HTML ===================================== {{{
" Configure closetag plugin
let g:closetag_filenames = '*.html,*.jsx,*.mjml'
" }}}
" vim:foldenable:foldmethod=marker
