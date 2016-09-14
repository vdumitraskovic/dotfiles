" Vundle setup
set nocompatible		" be iMproved, required
filetype off		  	" required


" Enable mouse
set mouse=a

" Set tabstops
set expandtab 			" Tabs are spaces
set shiftwidth=2
set softtabstop=2


" UI config
set number
set showcmd			    " show last command in bottom bar
set noshowmode      " hide mode (shown in airline)
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to
set showmatch       " highlight matching [{()}]
set laststatus=2    " fix airline

" Searching
set incsearch       " search as characters are entered
set hlsearch        " highlight matches

" Keymaps
" turn off search highlight
let mapleader=","
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


" Folding
set foldenable      " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10  " 10 nested folds max
set foldmethod=syntax

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
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
Plugin 'airblade/vim-gitgutter'

" Javascript plugins
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" HTML plugins
Plugin 'mattn/emmet-vim'

" Linting plugins
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()	      	" required
filetype plugin indent on	" required

" Enable syntax highlighting
syntax on

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
set background=dark
colorscheme solarized

" JSX config
let g:jsx_ext_required = 0

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Set ctrlp ignores
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Emmet settings
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" Set CSS filetypes
autocmd FileType scss ts=4 sts=4 sw=4 expandtab
autocmd FileType css ts=4 sts=4 sw=4 expandtab
