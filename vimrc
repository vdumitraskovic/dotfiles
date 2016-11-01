" Plug
" Install vim-plug if we don't already have it
if (has('win32'))
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
" Nice icons
Plug 'ryanoasis/vim-devicons'

" Generic
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'Konfekt/FastFold'
Plug 'jiangmiao/auto-pairs'
Plug 'myusuf3/numbers.vim'
Plug 'tpope/vim-capslock'
Plug 'godlygeek/tabular'
Plug 'dyng/ctrlsf.vim'

" Autocomplete
Plug 'Shougo/neocomplete.vim'
Plug 'othree/jspc.vim'

" Snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug '1995eaton/vim-better-javascript-completion'

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'idanarye/vim-merginal'

" Programming languages pack
Plug 'sheerun/vim-polyglot'

" Javascript plugins
Plug 'moll/vim-node'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

" HTML plugins
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'

" Linting plugins
Plug 'scrooloose/syntastic'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'Chiel92/vim-autoformat'

call plug#end()


" Enable mouse
set mouse=a

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

" Keymaps
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

" Airline powerline fonts
let g:airline_powerline_fonts = 1

" Airline config
let g:airline#extensions#tabline#enabled = 1

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden


" Strip whitespace on save
autocmd BufWritePre * StripWhitespace

" Theme setup
try
  colorscheme solarized
catch
endtry
set background=dark

" Javascript config
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "←"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

" JSX config
let g:jsx_ext_required = 0
autocmd FileType javascript.jsx setlocal tw=100

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
endif
let g:syntastic_scss_checkers = ['scss_lint']

" Set ctrlp
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_show_hidden = 1

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nnoremap <leader>fu :CtrlPFunky<cr>

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
let g:neocomplete#enable_at_startup = 1
if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif
let g:neocomplete#sources#omni#functions.javascript = [
      \   'jspc:#omni',
      \   'js#CompleteJS',
      \   'tern#Complete'
      \ ]

" Set gui (font, colors, options)
if has('gui_running')
  set guioptions-=T   "no toolbar
  set t_Co=256
  "set ambiwidth=double

  if has('gui_win32')
    " Set font
    set guifont=InconsolataForPowerline_NF:h12
    set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
    " Start maximized
    au GUIEnter * simalt ~x
  endif

  if has('gui_macvim')
    set guifont=InconsolataForPowerline_Nerd_Font:h14
    set lines=60 columns=110
  endif
endif

" Config backup
set backupdir-=.
set dir-=.
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

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=nc
endif

" Set key for autoformat
noremap <F3> :Autoformat<CR>

" Enable autoformat for SVG
let g:formatters_svg = ['tidy_xml']

" Add color column
set colorcolumn=+1

" Set ignored files
set wildignore+=*.bpm,*.gif,*.ico,*.jpg,*.png
set wildignore+=*.mp4

" Setup ag (the_silver_searcher)
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" CtrlSF config
let g:ctrlsf_position = 'bottom'
