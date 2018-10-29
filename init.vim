scriptencoding utf-8
" ======================= Global variables================================ {{{
let g:nvim_base = '~/.local/share/nvim/'
if has('win32')
  let g:nvim_base = '~/AppData/Local/nvim/'
endif
execute 'set runtimepath+=' . expand(g:nvim_base)
let g:goyo_on = 0
let g:background = 'light'
" }}}
" ========================== Plug Setup ================================== {{{
" Install vim-packager if we don't already have it
if has('win32')
  if empty(glob('$HOME/AppData/Local/nvim/pack/packager/opt/vim-packager'))
    execute '!mkdir \%USERPROFILE\%\\AppData\\Local\\nvim\\pack\\packager\\opt'
    execute '!git clone https://github.com/kristijanhusak/vim-packager \%USERPROFILE\%\\AppData\\Local\\nvim\\pack\\packager\\opt\\vim-packager'
  endif
else
  if empty(glob('~/.config/nvim/pack/packager/opt/vim-packager'))
    " Download the actual plugin manager
    execute '!git clone https://github.com/kristijanhusak/vim-packager ~/.config/nvim/pack/packager/opt/vim-packager'
  endif
endif
" }}}
" ============================ Plugins =================================== {{{
function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call packager#add('tpope/vim-repeat')
  call packager#add('sheerun/vim-polyglot')
  call packager#add('tpope/vim-commentary')
  call packager#add('https://gitlab.com/protesilaos/tempus-themes-vim.git')
  call packager#add('romainl/flattened')
  call packager#add('airblade/vim-gitgutter')
  call packager#add('vim-airline/vim-airline')
  call packager#add('vim-airline/vim-airline-themes')
  call packager#add('arcticicestudio/nord-vim')
  call packager#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
  call packager#add('w0rp/ale')
  call packager#add('tpope/vim-fugitive')
  call packager#add('dyng/ctrlsf.vim')
  call packager#add('vimwiki/vimwiki')
  call packager#add('AndrewRadev/splitjoin.vim')
  call packager#add('tpope/vim-surround')
  call packager#add('galooshi/vim-import-js')
  call packager#add('sbdchd/neoformat')
  call packager#add('mattn/emmet-vim')
  call packager#add('tpope/tpope-vim-abolish')
  call packager#add('junegunn/goyo.vim')
  call packager#add('junegunn/limelight.vim')
  call packager#add('Raimondi/delimitMate')
  call packager#add('SirVer/ultisnips')
  call packager#add('honza/vim-snippets')
  call packager#add('reedes/vim-pencil')
  call packager#add('othree/javascript-libraries-syntax.vim')
  call packager#add('justinmk/vim-sneak')
  call packager#add('mtth/scratch.vim')
  call packager#add('chaoren/vim-wordmotion')
  call packager#add('ludovicchabant/vim-gutentags')
  call packager#add('majutsushi/tagbar')
  call packager#add('junegunn/fzf')
  call packager#add('junegunn/fzf.vim')
  call packager#add('PeterRincker/vim-argumentative')
  call packager#add('alvan/vim-closetag')
  call packager#add('scrooloose/nerdtree')
  call packager#add('metakirby5/codi.vim')
  call packager#add('amadeus/vim-mjml')
  call packager#add('autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ })
  call packager#add('janko-m/vim-test')
  call packager#add('tpope/vim-projectionist')
  call packager#add('editorconfig/editorconfig-vim')
  call packager#add('kamykn/CCSpellCheck.vim')
  call packager#add('liuchengxu/vim-which-key')
  call packager#add('andymass/vim-matchup')
  call packager#add('christoomey/vim-tmux-navigator')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! PackagerUpdate call PackagerInit() | call packager#update()
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()
" }}}
" ============================ General =================================== {{{
set ttimeout
set ttimeoutlen=100
set updatetime=100
set synmaxcol=200
let g:test#strategy = 'make'
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
let g:loaded_netrwPlugin = 1

" Configure NERDTree
let g:NERDTreeWinPos = 'right'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeMinimalUI = 1
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
nnoremap <leader>tl :Tags<CR>

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
  if (&filetype ==# 'scss')
    let s:prefix = '_'
    let s:ext = '.scss'
  endif
  exec 'edit ' . expand('%:p:h') . '/' . fnamemodify(a:filename, ':h') .
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

" LanguageClient-neovim
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" Vim which key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Sudo write
cnoremap w!! execute 'silent! write !sudo tee % > /dev/null' <bar> edit!

" Window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal mappings
tnoremap <M-[> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" }}}
" ======================== Visual settings =============================== {{{
set nolazyredraw
set cursorline
set number
set relativenumber

" Terminal tweaking
au TermOpen * setlocal nonumber norelativenumber

" FZF tweaking
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'ErrorMsg'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine'],
  \ 'hl+':     ['fg', 'ErrorMsg'],
  \}

function! s:focus_enter()
  if g:goyo_on
    return
  endif
  set cursorline
  if &l:number
    set relativenumber
  endif
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
set foldlevelstart=5

set wildignorecase

" Always use vertical diffs
set diffopt+=vertical

" Auto open quickfix
augroup QuickFix
  autocmd QuickFixCmdPost [^l]* nested cwindow
augroup END

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set list

let g:gitgutter_override_sign_column_highlight = 1

" Colorize vimwiki headers
let g:vimwiki_hl_headers = 1

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
let g:solarized_extra_hi_groups=1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_comment_brightness = 5
let g:nord_cursor_line_number_background = 1
" set background=light
let &background=g:background
" colorscheme dracula
" colorscheme flatcolor
" colorscheme gruvbox
" colorscheme PaperColor
" colorscheme OceanicNext
" colorscheme solarized8_high
" colorscheme flattened_dark
" colorscheme carbonized-light

" augroup nord-overrides
"   autocmd!
"   " autocmd ColorScheme nord highlight Folded cterm=none gui=none ctermbg=0 ctermfg=8 guibg=#2E3440 guifg=#66738E
" augroup END

colorscheme flattened_light

function! s:tweak_theme()
  set fillchars+=vert:\│
  hi VertSplit guibg=NONE ctermbg=NONE " Just show fillchar please
  highlight CCSpellBad cterm=underline gui=underline
  highlight link MatchParen Search
  highlight link MatchWord Search
  " highlight Comment ctermbg=0 guibg=NONE ctermfg=1 guifg=#999999
  " highlight CCSpellBad cterm=underline ctermfg=11 gui=underline guifg=#BF616A
endfunction
augroup colorscheme
  autocmd ColorScheme * call <sid>tweak_theme()
augroup end

" Airline
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1
let g:airline_highlighting_cache = 1
set noshowmode

" WhichKey tweak
augroup which-key-overrides
  " autocmd FileType which_key highlight WhichKeySeperator guibg=NONE ctermbg=NONE
augroup END
" }}}
" ============================ Editing =================================== {{{
set expandtab
set shiftwidth=2
set softtabstop=2
set showmatch
set inccommand=split

" Use system clipboard
set clipboard=unnamed,unnamedplus

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

" Gitgutter tweak https://github.com/airblade/vim-gitgutter/issues/502
augroup GitGutter
  autocmd BufWritePost * GitGutter
augroup END

" Deoplete options
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" LanguageClient settings
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'javascript.jsx': ['javascript-typescript-stdio']
\ }
let g:LanguageClient_diagnosticsEnable = 0

" Split join config
let g:splitjoin_html_attributes_bracket_on_new_line = 1
" }}}
" ======================== Linter settings =============================== {{{
" Ale config
let g:ale_linters = {'javascript': ['eslint']}
if !exists('g:ale_fixers')
  let g:ale_fixers = {}
endif
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.javascript = ['eslint']
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_change_sign_column_color = 0
" }}}
" =========================== Searching ================================== {{{
set ignorecase
set smartcase

" Setup rg(ripgrep) / ag (the_silver_searcher)
if executable('rg')
  set grepprg=rg\ -S\ --vimgrep\ -g\ '!tags'
  set grepformat^=%f:%l:%c:%m
  let g:ctrlp_user_command = ['.git', 'rg %s --files --color=never', 'rg %s --files --no-ignore']
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Disable changing of cwd when changing dir
let g:ctrlp_working_path_mode = '0'

augroup FZF
  autocmd! FileType fzf setlocal noshowmode
augroup END

" Sneak setup
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
" }}}
" ======================== Writing plugins =============================== {{{
let g:vimwiki_folding = 'syntax'

let g:CCSpellCheckEnable = 1

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
  let &background=g:background
  call <SID>tweak_theme()
  call <SID>focus_enter()
endfunction

augroup Goyo
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
  autocmd FileType vimwiki      call pencil#init({'autoformat': 0})
augroup END
" }}}
" =========================== Snippets =================================== {{{
let g:UltiSnipsSnippetsDir = g:nvim_base . 'UltiSnips'
augroup Snippets
  " Enable es6 snippets for javascript by default
  autocmd FileType javascript UltiSnipsAddFiletypes javascript-es6
  " Enable jsx snippets
  autocmd FileType javascript.jsx UltiSnipsAddFiletypes javascript-react
augroup END
" }}}
" ========================== Javascript ================================== {{{
augroup JavaScript
  autocmd FileType javascript setlocal include=from[\ ]
  " Setup errorformat for Jest
  autocmd FileType javascript setlocal errorformat=%.%#\ at\ %f:%l:%c,%.%#\ at\ %.%#(%f:%l:%c)
augroup END

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
augroup SCSS
  autocmd FileType scss setlocal sw=4
augroup END
" }}}
" ============================= HTML ===================================== {{{
" Configure closetag plugin
let g:closetag_filenames = '*.html,*.jsx,*.mjml'
" }}}
" vim:foldenable:foldmethod=marker
