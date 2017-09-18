" Native packages
packadd! matchit

" Install vim-plug if we don't already have it
if has('win32')
  if empty(glob("$HOME/vimfiles/autoload/plug.vim"))
      " Ensure all needed directories exist  (Thanks @kapadiamush)
      execute '!mkdir \%USERPROFILE\%\\vimfiles\\plugged'
      execute '!mkdir \%USERPROFILE\%\\vimfiles\\autoload'
      " Download the actual plugin manager
      execute '!curl -fkLo \%USERPROFILE\%\\vimfiles\\autoload\\plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  endif
else
  if empty(glob("~/.vim/autoload/plug.vim"))
      " Ensure all needed directories exist  (Thanks @kapadiamush)
      execute '!mkdir -p ~/.vim/plugged'
      execute '!mkdir -p ~/.vim/autoload'
      " Download the actual plugin manager
      execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  endif
endif


call plug#begin('~/.vim/plugged')

" Put plugins here

" Generic
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/tpope-vim-abolish'
" Plug 'tpope/vim-capslock'
Plug 'godlygeek/tabular'
Plug 'dyng/ctrlsf.vim'
Plug 'schickling/vim-bufonly'
Plug 'chaoren/vim-wordmotion'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'

" Themes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'reedes/vim-thematic'

" Autocomplete
" Plug 'Shougo/neocomplete.vim'
Plug 'Valloric/YouCompleteMe'
" Plug 'othree/jspc.vim'

" Snippets
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'
" Plug 'honza/vim-snippets'
" Plug '1995eaton/vim-better-javascript-completion'

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'

" Programming languages pack
Plug 'sheerun/vim-polyglot'

" Graphviz
Plug 'wannesm/wmgraphviz.vim'

" Javascript plugins
Plug 'moll/vim-node'
Plug 'galooshi/vim-import-js'

" HTML plugins
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'

" Linting plugins
Plug 'w0rp/ale'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'sbdchd/neoformat'

" Note taking
Plug 'vimwiki/vimwiki'

" Prose writing
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Windows enhancements
Plug 'kkoenig/wimproved.vim', { 'on': [] }

" PairProgramming
" Plug 'Floobits/floobits-vim'

" Misc
"Plug 'vim-scripts/restore_view.vim'
Plug 'mtth/scratch.vim'

call plug#end()


" Globals
set noswapfile
set autowrite

" Use one space, not two, after punctuation.
set nojoinspaces

" Enable mouse
set mouse=a
set viewoptions=cursor,folds,slash,unix

" Set tabstops
set expandtab 			" Tabs are spaces
set smarttab                    " Be smart when using tabs
set shiftwidth=2
set softtabstop=2


" UI config
set nocompatible    " be iMproved, required
set number
set showcmd	    " show last command in bottom bar
set noshowmode      " hide mode (shown in airline)
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to
set showmatch       " highlight matching [{()}]
set laststatus=2    " fix airline

augroup highlight_follows_focus
  autocmd!
  autocmd WinEnter * set cursorline
  autocmd WinLeave * set nocursorline
augroup END

augroup highligh_follows_vim
  autocmd!
  autocmd FocusGained * set cursorline
  autocmd FocusLost * set nocursorline
augroup END

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Sets how many lines of history VIM has to remember
set history=500

" Searching
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

set incsearch       " search as characters are entered
set hlsearch        " highlight matches

" Reduce update time
set updatetime=250

" Reduce key timeout
set ttimeout
set ttimeoutlen=10

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Keymaps

" Disable Arrow keys in Escape mode
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
"
" " Disable Arrow keys in Insert mode
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>
"

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Remap leader to ','
let mapleader=","

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
map <C-n> :NERDTreeToggle<CR>
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

" Folding
set foldenable      " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10  " 10 nested folds max
set foldmethod=syntax


filetype plugin indent on	" required

" Enable syntax highlighting
syntax on

" Set encoding
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" Window movement
map <M-h> <C-w>h
map <M-j> <C-w>j
map <M-k> <C-w>k
map <M-l> <C-w>l

" Airline powerline fonts
let g:airline_powerline_fonts = 1

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_highlighting_cache = 1
let g:airline_skip_empty_sections = 1

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden


" Strip whitespace on save
autocmd BufWritePre * StripWhitespace

" Set term colors
if !has("gui_running")
  set termguicolors
  set t_Co=256
  " let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  " let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  if has("win32")
    set term=xterm
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>
  endif
endif

if exists('$ITERM_PROFILE')
  if exists('$TMUX')
    let &t_SI = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[0 q"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif

" Theme setup
let g:enable_bold_font=1
let g:enable_italic_font=1
let g:airline_theme = "hybrid"
colorscheme hybrid_material
set background=dark
set fillchars+=vert:\│

" Thematic setup
let g:thematic#themes = {
\ 'light'         :{ 'colorscheme': 'lightning',
\                    'airline-theme': 'papercolor',
\                    'background': 'light'
\                  },
\ 'dark'          :{ 'colorscheme': 'molokai',
\                    'background': 'dark',
\                    'airline-theme': 'molokai'
\                  },
\ 'solarized-dark':{ 'colorscheme': 'solarized8_dark',
\                    'airline-theme': 'solarized',
\                    'background': 'dark'
\                  },
\ 'hybrid_material':{ 'colorscheme': 'hybrid_material',
\                    'background': 'dark',
\                    'airline-theme': 'hybrid'
\                  }
\ }

" Javascript config

" JSX config
let g:jsx_ext_required = 0
autocmd FileType javascript.jsx setlocal tw=100

" Ale config
let g:ale_linters = {'javascript': ['eslint']}
if !exists('g:ale_fixers')
  let g:ale_fixers = {}
endif
let g:ale_fixers.javascript = ['eslint']
let g:ale_lint_delay = 200
let g:ale_lint_on_text_changed = 'normal'

" Ale linting events
autocmd CursorHold * call ale#Lint()
autocmd CursorHoldI * call ale#Lint()
autocmd InsertEnter * call ale#Lint()
autocmd InsertLeave * call ale#Lint()

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>


" Set ctrlp
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_show_hidden = 1
let g:user_command_async = 1

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nnoremap <leader>fu :CtrlPFunky<cr>
let g:ctrlp_funky_syntax_highlight = 1

" Emmet settings
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" Set CSS filetypes
autocmd FileType scss setlocal ts=4 sts=4 sw=4
autocmd FileType css setlocal ts=4 sts=4 sw=4

" Vim close tag config
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js"

" Match tag always config
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx': 1}
nnoremap <leader>% :MtaJumpToOtherTag<cr>

" Enable neocomplete
" let g:neocomplete#enable_at_startup = 1
" if !exists('g:neocomplete#sources#omni#functions')
  " let g:neocomplete#sources#omni#functions = {}
" endif
" let g:neocomplete#sources#omni#functions.javascript = [
      " \   'jspc#omni',
      " \   'js#CompleteJS',
      " \ ]

" Mac keys setup
if has('mac') || has('win32')
  " fix meta-keys which generate <Esc>a .. <Esc>z
  let c='a'
  while c <= 'z'
    exec "set <M-".c.">=\e".c
    exec "imap \e".c." <M-".c.">"
    let c = nr2char(1+char2nr(c))
  endw
endif

" Set gui (font, colors, options)
if has('gui_running')
  set guioptions-=T   "no toolbar
  set guioptions-=m  "remove menu bar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set t_Co=256
  "set ambiwidth=double

  if has('gui_win32')
    " Set font
    set guifont=Iosevka_Slab_Light:h10:cANSI:qCLEARTYPE
    set rop=type:directx,gamma:1,contrast:1,level:.5,geom:1,renmode:5,taamode:1
    " Start maximized
    call plug#load('wimproved.vim')
    au GUIEnter * silent! WToggleScreen
  endif

  if has('gui_macvim')
    set guifont=Iosevka:h13
    set macligatures
    set lines=60 columns=110
    set macmeta
  endif
endif

" Config Directories
set backupdir-=.
set dir-=.
set viewdir=~/.vimviews
if has("win32")
  set backupdir^=$TEMP
  set dir^=$TEMP
else
  set backupdir^=~/tmp,/tmp
  set dir^=~/tmp,/tmp
endif

" Set to auto read when a file is changed from the outside
set autoread

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Config NerdTree
let NERDTreeWinPos = "right"

" Config Nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Config neosnippets
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Set key for autoformat
noremap <F3> :Neoformat<CR>

" Enable autoformat for SVG
" let g:formatters_svg = ['tidy_xml']
" Use prettier for autoformating javascript
" let g:formatdef_prettier_javascript='"prettier-eslint --stdin"'
" let g:formatters_javascript = ['prettier_javascript']
autocmd FileType javascript setlocal formatprg=prettier-eslint\ --stdin\ --single-quote\ --trailing-comma\ all
" Use formatprg when available
let g:neoformat_try_formatprg = 1

" Add color column
set colorcolumn=+1

" Set ignored files
set wildignore+=*.bpm,*.gif,*.ico,*.jpg,*.png
set wildignore+=*.mp4

" Setup rg(ripgrep) / ag (the_silver_searcher)
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -S -l --nocolor -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" CtrlSF config
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_default_root = 'project'

" WordMotion config
" let g:wordmotion_prefix = '<localleader>'

" Set writing plugins
let g:vimwiki_folding = 'syntax'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
  autocmd FileType vimwiki      call pencil#init({'autoformat': 0})
augroup END

autocmd! User GoyoEnter Limelight
autocmd User GoyoEnter NumbersToggle
autocmd User GoyoEnter NumbersOnOff
autocmd! User GoyoLeave Limelight!
autocmd User GoyoLeave NumbersToggle
autocmd User GoyoLeave NumbersOnOff

" Tagbar config
nmap <F8> :TagbarToggle<CR>

" Auto pairs fly mode
let g:AutoPairsFlyMode = 1

" Vim startify config
let g:startify_session_autoload = 1
let g:startify_session_persistence = 0
let g:startify_change_to_vcs_root = 1
