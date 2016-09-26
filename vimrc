" Vundle setup
set nocompatible		" be iMproved, required
filetype off		  	" required


" Enable mouse
set mouse=a

" Set tabstops
set expandtab 			" Tabs are spaces
set smarttab                     " Be smart when using tabs
set shiftwidth=2
set softtabstop=2


" UI config
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

" set the runtime path to include Vundle and initialize
if has("win32")
  set rtp+=%HOME%/vimfiles/bundle/Vundle.vim
else
 set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Put plugins here
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'easymotion/vim-easymotion'
Plugin 'Konfekt/FastFold'
Plugin 'jiangmiao/auto-pairs'
Plugin 'myusuf3/numbers.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'tpope/vim-capslock'

" Autocomplete
Plugin 'Shougo/neocomplete.vim'

" Git plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'idanarye/vim-merginal'

" Javascript plugins
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" HTML plugins
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'Valloric/MatchTagAlways'

" Linting plugins
Plugin 'scrooloose/syntastic'
Plugin 'whatyouhide/vim-lengthmatters'

" All of your Plugins must be added before the following line
call vundle#end()	      	" required
filetype plugin indent on	" required

" Enable syntax highlighting
syntax on

" Set encoding
set encoding=utf-8

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

" Set ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_show_hidden = 1

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

" Set gui (font, colors, options)
if has('gui_running')
  set guioptions-=T   "no toolbar
  set t_Co=256

  if has('gui_win32')
    " Set font
    set guifont=Inconsolata_for_Powerline:h12:cANSI
    " Start maximized
    au GUIEnter * simalt ~x
  endif

  if has('gui_macvim')
    set guifont=Inconsolata_for_Powerline:h14
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

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
