" Vundle setup
set nocompatible		" be iMproved, required
filetype off		  	" required


" Enable mouse
set mouse=a

" Set tabstops
set tabstop=2
set softtabstop=2
set expandtab 			" Tabs are spaces


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


" Folding
set foldenable      " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10  " 10 nested folds max


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

" All of your Plugins must be added before the following line
call vundle#end()	      	" required
filetype plugin indent on	" required

" Airline powerline fonts
let g:airline_powerline_fonts = 1

" Theme setup
set background=dark
colorscheme solarized

