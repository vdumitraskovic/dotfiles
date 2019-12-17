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
  call packager#init({ 'depth': 1, 'jobs': 8  })
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call packager#add('lambdalisue/vim-backslash')
  call packager#add('tpope/vim-repeat')
  call packager#add('sheerun/vim-polyglot', { 'type': 'opt' })
  call packager#add('tpope/vim-commentary')
  call packager#add('airblade/vim-gitgutter', { 'do': function('SetGitGutter'), 'type': 'opt' })
  call packager#add('vim-airline/vim-airline', { 'type': 'opt' })
  call packager#add('vim-airline/vim-airline-themes', { 'type': 'opt' })
  call packager#add('w0rp/ale', { 'type': 'opt' })
  call packager#add('tpope/vim-fugitive', { 'type': 'opt' })
  call packager#add('dyng/ctrlsf.vim', { 'type': 'opt' })
  call packager#add('vimwiki/vimwiki')
  call packager#add('AndrewRadev/splitjoin.vim', { 'type': 'opt' })
  call packager#add('tpope/vim-eunuch', { 'type': 'opt' })
  call packager#add('tpope/vim-surround', { 'type': 'opt' })
  call packager#add('galooshi/vim-import-js')
  call packager#add('sbdchd/neoformat')
  call packager#add('mattn/emmet-vim', { 'type': 'opt' })
  call packager#add('tpope/tpope-vim-abolish', { 'type': 'opt' })
  call packager#add('junegunn/goyo.vim', { 'type': 'opt' })
  call packager#add('junegunn/limelight.vim')
  call packager#add('Raimondi/delimitMate', { 'type': 'opt' })
  call packager#add('SirVer/ultisnips', { 'type': 'opt' })
  call packager#add('honza/vim-snippets')
  call packager#add('reedes/vim-pencil')
  call packager#add('justinmk/vim-sneak', { 'type': 'opt' })
  call packager#add('mtth/scratch.vim')
  call packager#add('chaoren/vim-wordmotion', { 'type': 'opt' })
  call packager#add('ludovicchabant/vim-gutentags', { 'type': 'opt' })
  call packager#add('junegunn/fzf', { 'type': 'opt' })
  call packager#add('junegunn/fzf.vim', { 'type': 'opt' })
  call packager#add('PeterRincker/vim-argumentative', { 'type': 'opt' })
  call packager#add('alvan/vim-closetag', { 'type': 'opt' })
  call packager#add('scrooloose/nerdtree', { 'type': 'opt' })
  call packager#add('metakirby5/codi.vim')
  call packager#add('amadeus/vim-mjml')
  call packager#add('neoclide/coc.nvim', { 'do': function('InstallCoc'), 'type': 'opt' })
  call packager#add('janko-m/vim-test', { 'type': 'opt' })
  call packager#add('tpope/vim-projectionist')
  call packager#add('editorconfig/editorconfig-vim', { 'type': 'opt' })
  call packager#add('kamykn/spelunker.vim', { 'type': 'opt' })
  call packager#add('liuchengxu/vim-which-key')
  call packager#add('andymass/vim-matchup', { 'type': 'opt' })
  call packager#add('christoomey/vim-tmux-navigator')
  call packager#add('machakann/vim-highlightedyank')
  call packager#add('AndrewRadev/tagalong.vim')
  call packager#add('liuchengxu/vista.vim', { 'type': 'opt' })
  call packager#add('reedes/vim-colors-pencil')
endfunction

function! InstallCoc(plugin) abort
  exe '!cd '.a:plugin.dir.' && yarn install'
  call coc#add_extension('coc-tsserver', 'coc-html', 'coc-css', 'coc-json')
  call coc#config('codeLens.enable', 'true')
  call coc#config('coc.preferences.formatOnType', 'false')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

" Deferred plugins
augroup deferred_plugins
  autocmd!
  autocmd CursorHold,CursorHoldI *
        \ packadd ale |
        \ packadd vim-closetag |
        \ packadd coc.nvim |
        \ packadd ctrlsf.vim |
        \ packadd delimitMate |
        \ packadd editorconfig-vim |
        \ packadd emmet-vim |
        \ packadd fzf |
        \ packadd fzf.vim |
        \ packadd goyo.vim |
        \ packadd nerdtree |
        \ packadd spelunker.vim |
        \ packadd splitjoin.vim |
        \ packadd tpope-vim-abolish |
        \ packadd ultisnips |
        \ packadd vim-airline |
        \ packadd vim-airline-themes |
        \ packadd vim-argumentative |
        \ packadd vim-fugitive |
        \ packadd vim-eunuch |
        \ packadd vim-gitgutter |
        \ packadd vim-gutentags |
        \ packadd vim-matchup |
        \ packadd vim-polyglot |
        \ packadd vim-sneak |
        \ packadd vim-surround |
        \ packadd vim-test |
        \ packadd vim-wordmotion |
        \ packadd vista.vim |
        \ set updatetime=100 |
        \ syntax on |
        \ call <sid>tweak_theme() |
        \ doautoall BufRead |
        \ autocmd! deferred_plugins
augroup END

function! SetGitGutter() abort
  " Gitgutter
  augroup GitGutter
    " tweak https://github.com/airblade/vim-gitgutter/issues/502
    autocmd BufWritePost,WinEnter * GitGutter
    " disable realtime update
    autocmd VimEnter * exe "autocmd! gitgutter CursorHold,CursorHoldI"
    " enable gitgutter on update
    autocmd BufWritePost * GitGutter
  augroup END
endfunction
" }}}
" ============================ General =================================== {{{
set ttimeout
set ttimeoutlen=100
set updatetime=500
set synmaxcol=200
set mouse=a
set switchbuf=usetab
syntax off

let g:test#strategy = 'make'

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Terminal tweakings
augroup terminal
  autocmd TermOpen * startinsert
augroup end

function! Jump(motion) range
  let cnt = v:count1
  let save = getreg('/')
  mark '
  while cnt > 0
    silent! execute a:motion
    let cnt = cnt - 1
  endwhile
  call histdel('/', -1)
  call setreg('/', save)
endfunction

" Vista settings
let g:vista_executive_for = {
  \ 'javascript': 'coc',
  \ 'scala': 'coc',
  \ }
let g:vista#renderer#enable_icon = 0
" }}}
" ======================= Files and folders=============================== {{{
set fileformats=unix,dos
set path+=src,src/**,frontend,frontend/**
set undofile
set backupcopy=yes
exec 'set undodir=' . g:nvim_base . 'undodir'

" Automatically reload file
set noswapfile
set nowritebackup
set nobackup
set autoread
augroup autoreload
  autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | checktime | endif
augroup END

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
" Command mode mappings
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
set wildcharm=<C-z>
cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<C-g>' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<C-t>' : '<S-Tab>'

" Remap leader to '<Space>'
let g:mapleader="\<Space>"

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
inoremap jk <esc>

" Buffer keys
" To open a new empty buffer
nmap <leader>N :enew<CR>
" Move to the previous buffer
nmap [b :bprevious<CR>
" Move to the next buffer
nmap ]b :bnext<CR>
" Move to the first buffer
nmap [B :bfirst<CR>
" Move to the last buffer
nmap ]B :blast<CR>
" Close all buffers but open one
nmap <leader>bo :silent w <BAR> :silent %bd <BAR> e#<CR>
nnoremap <BS> <C-^>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" nnoremap <leader>bl :b <C-d>
" nnoremap <leader>bl :CtrlPBuffer<CR>
nnoremap <leader>bl :Buffers<CR>

" Quickfix/loclist mapping
" Move to the previous quickfix
nmap [q :cprevious<CR>
" Move to the next quickfix
nmap ]q :cnext<CR>
" Move to the first quickfix
nmap [Q :cfirst<CR>
" Move to the last quickfix
nmap ]Q :clast<CR>
" Move to the previous loclist
nmap [l :lprevious<CR>
" Move to the next loclist
nmap ]l :lnext<CR>
" Move to the first loclist
nmap [L :lfirst<CR>
" Move to the last loclist
nmap ]L :llast<CR>

nnoremap <Down> :cnext<cr>
nnoremap <Up> :cprevious<cr>
nnoremap <Right> :cnfile<cr>
nnoremap <Left> :cpfile<cr>

nnoremap <S-Down> :lnext<cr>
nnoremap <S-Up> :lprevious<cr>
nnoremap <S-Right> :lnfile<cr>
nnoremap <S-Left> :lpfile<cr>

" Tabs mapping
" Open new tab
nmap <leader>T :tabnew<CR>
" Close tab
nmap <leader>tq :tabclose<CR>
" Move to the previous quickfix
nmap [t :tabprevious<CR>
" Move to the next quickfix
nmap ]t :tabnext<CR>
" Move to the first quickfix
nmap [T :tabfirst<CR>
" Move to the last quickfix
nmap ]T :tablast<CR>

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
noremap <C-S> :update<CR>

" Find file
" noremap <C-p> :find<Space>
let g:ctrlp_map = ''
noremap <C-p> :Files<CR>

" Open NERDTree for opened file
noremap <F22> :NERDTreeFind<cr>

" NERDTree like vim-vinegar.
nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>

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
map <F10> :NERDTreeToggle<CR>

" Autoformat
nnoremap <F2> :Neoformat<CR>
vnoremap <F2> :'<,'>Neoformat<CR>

set pastetoggle=<F3>

" Goyo
nnoremap <F11> :Goyo<CR>

" Quick close help
noremap <S-F1> :helpclose<CR>
noremap <F13> :helpclose<CR>

" Open vista.vim
nmap <F8> :Vista!!<CR>

" Show git status
nnoremap <F9> :Gstatus<CR>

" Close loclists and quicfix and git status
nnoremap <F12> :windo lcl\|ccl\|Gstatus\|q<CR>
nnoremap <F7> :silent execute 'grep -w ' . expand('<cword>')<CR> <BAR> :redraw!<CR>

" Don't load Scratch window mappings
let g:scratch_no_mappings = 1

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K :call CocAction('doHover')<CR>
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use +/- for select selections ranges, needs server support, like: coc-tsserver, coc-python
vmap <silent> + <Plug>(coc-range-select)
vmap <silent> - <Plug>(coc-range-select-backword)

" Vim which key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Sudo write
cnoremap w!! execute 'silent! write !sudo tee % > /dev/null' <bar> edit!

" Zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Window movement
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" Terminal mappings
tnoremap <M-[> <C-\><C-n>
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l

" Insert mode movement
inoremap <M-l> <C-o>l
inoremap <M-h> <C-o>h
inoremap <M-j> <C-o>j
inoremap <M-k> <C-o>k

" Vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>

" Create folders as needed
cnoremap mk. !mkdir -p <c-r>=expand("%:h")<cr>

" Alternate "nonumber | number | relativenumber"
nnoremap <leader>n :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<cr>

" CtrlSF shortcut
nmap <S-F7> <Plug>CtrlSFCwordExec
nmap <F19> <Plug>CtrlSFCwordExec

" Toggle syntax
function! ToggleSyntax()
  if exists('b:old_syntax')
    let &l:syntax=b:old_syntax
    unlet b:old_syntax
  else
    let b:old_syntax=&l:syntax
    set syntax=
  endif
endfunction
nnoremap <leader>S :call ToggleSyntax()<cr>

" Easy toggle fold
nnoremap <s-tab> za

" Easy repeat macro
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'
" }}}
" ======================== Visual settings =============================== {{{
set lazyredraw
set nocursorline
set nonumber
set norelativenumber
set signcolumn=yes

" Automatically rebalance windows on vim resize
augroup balance-windows
  autocmd VimResized * :wincmd =
augroup END

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
  set nocursorline
  if &l:number
    set relativenumber
  endif
  if exists('g:airline_section_a')
    let w:airline_section_a = g:airline_section_a
    let w:airline_section_b = g:airline_section_b
    let w:airline_section_c = g:airline_section_c
    let w:airline_section_x = g:airline_section_x
    let w:airline_section_y = g:airline_section_y
    let w:airline_section_z = g:airline_section_z
  endif
endfunction
function! s:focus_leave()
  set nocursorline
  set norelativenumber
  let w:airline_section_a = '%f'
  let w:airline_section_b = ''
  let w:airline_section_c = ''
  let w:airline_section_x = ''
  let w:airline_section_y = ''
  let w:airline_section_z = ''
endfunction

augroup EditorFocus
  autocmd! WinEnter * call <SID>focus_enter()
  autocmd! WinLeave * call <SID>focus_leave()
  autocmd! FocusGained * call <SID>focus_enter()
  autocmd! FocusLost * call <SID>focus_leave()
augroup END

set foldmethod=syntax
set foldlevelstart=7

set wildignorecase

" Tweak diff
set diffopt+=algorithm:histogram,indent-heuristic

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
let &background=g:background

let g:pencil_higher_contrast_ui=0
let g:pencil_terminal_italics=1
colorscheme pencil
let g:airline_theme='pencil'

function! s:tweak_theme() abort
  set fillchars+=vert:\│
  hi VertSplit guibg=NONE ctermbg=NONE " Just show fills please
  hi SpelunkerSpellBad cterm=undercurl gui=undercurl
  " highlight CCSpellBad cterm=undercurl gui=undercurl

  highlight MatchParen cterm=bold gui=bold
  highlight MatchWord cterm=bold gui=bold

  highlight ALEErrorSign ctermbg=NONE ctermfg=160 guibg=NONE guifg=#dc322f
  highlight ALEVirtualTextError ctermfg=160 guifg=#dc322f
  highlight ALEWarningSign ctermbg=NONE ctermfg=32 guibg=NONE guifg=#268bd2
  highlight ALEVirtualTextWarning ctermfg=32 guifg=#268bd2

  highlight HighlightedyankRegion ctermbg=254 guibg=#dddddd
endfunction
augroup colorscheme
  autocmd ColorScheme * call <sid>tweak_theme()
augroup end
augroup vimreload
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup end

" Airline
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1
let g:airline_highlighting_cache = 1
let g:airline_exclude_preview = 1
let g:airline_focuslost_inactive = 1
set noshowmode

" WhichKey tweak
augroup which-key-overrides
  " autocmd FileType which_key highlight WhichKeySeperator guibg=NONE ctermbg=NONE
augroup END

" COC
augroup COC
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END
" }}}
" ============================ Editing =================================== {{{
set expandtab
set shiftwidth=2
set softtabstop=2
set showmatch
set nojoinspaces
set shiftround
set inccommand=split
set shortmess+=a
set shortmess+=c
set shortmess+=I
set shortmess+=s

" Use system clipboard
set clipboard=unnamed,unnamedplus

" Use prettier for formating javascript
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_javascriptreact = ['prettier']

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
let g:wordmotion_mappings = {
      \ 'w': '<M-w>',
      \ 'b': '<M-b>',
      \ 'e': '<M-e>',
      \ 'ge': '<M-ge>',
      \ 'aw': '<M-aw>',
      \ 'iw': '<M-iw>',
      \ '<C-R><C-W>': '<C-R><M-w>',
      \ }

" Delimate config
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Split join config
let g:splitjoin_html_attributes_bracket_on_new_line = 1

augroup COC
  autocmd FileType javascript,javascriptreact,typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Codi settings
let g:codi#interpreters = {
      \ 'scala': {
        \ 'bin': 'scala',
        \ 'prompt': 'scala> '
        \ }
      \ }
" }}}
" ======================== Linter settings =============================== {{{
" Ale config
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'scss': ['stylelint']
      \ }
if !exists('g:ale_fixers')
  let g:ale_fixers = {}
endif
let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']
let g:ale_fixers.javascript = ['eslint']
let g:ale_fixers.javascriptreact = ['eslint']
let g:ale_fixers.css = ['stylelint', 'prettier']
let g:ale_fixers.scss = ['stylelint', 'prettier']
let g:ale_lint_on_enter = 1
let g:ale_lint_on_filetype_changed = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 1
let g:ale_set_signs = 1
let g:ale_change_sign_column_always = 1
let g:ale_change_sign_column_color = 0
let g:ale_virtualtext_cursor = 1
let g:ale_sign_error = '✕'
let g:ale_sign_warning = '▲'
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
let g:sneak#use_ic_scs = 1
let g:sneak#label = 1
" }}}
" ======================== Writing plugins =============================== {{{
let g:vimwiki_folding = 'syntax'
let g:vimwiki_list = [{'path': '~/vimwiki/'}, {'path': '~/localwiki/'}]
function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename ==# ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    exe 'edit ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction

" Goyo + Limelight
function! s:goyo_enter()
  Limelight
  set nonumber
  set noshowmode
  set noshowcmd
  let g:goyo_on = 1
  ALEDisable
  call <SID>focus_leave()
endfunction

function! s:goyo_leave()
  Limelight!
  set nonumber
  set showmode
  set showcmd
  let g:goyo_on = 0
  let &background=g:background
  ALEEnable
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

" 2: Highlight only SpellBad.
let g:spelunker_highlight_type = 2
" Disable default autogroup. (default: 0)
let g:spelunker_disable_auto_group = 1
let g:spelunker_check_type = 2
augroup spelunker
  autocmd!
  autocmd CursorHold *.vim,*.js,*.jsx,*.json,*.md if expand('<afile>') != "package-lock.json" | call spelunker#check_displayed_words() | endif
augroup END
" }}}
" =========================== Snippets =================================== {{{
let g:UltiSnipsSnippetsDir = g:nvim_base . 'UltiSnips'
augroup Snippets
  autocmd FileType javascriptreact UltiSnipsAddFiletypes javascript
augroup END
" }}}
" ========================== Javascript ================================== {{{
augroup JavaScript
  autocmd FileType javascript,javascriptreact setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
  " Setup errorformat for Jest
  autocmd FileType javascript,javascriptreact setlocal errorformat=%.%#\ at\ %f:%l:%c,%.%#\ at\ %.%#(%f:%l:%c)
  autocmd FileType javascript,javascriptreact call importjs#Init()
  autocmd FileType javascript,javascriptreact let b:splitjoin_split_callbacks = [
      \ 'sj#html#SplitTags',
      \ 'sj#html#SplitAttributes',
      \ 'sj#js#SplitArray',
      \ 'sj#js#SplitObjectLiteral',
      \ 'sj#js#SplitFunction',
      \ 'sj#js#SplitOneLineIf',
      \ 'sj#js#SplitArgs'
      \ ]

  autocmd FileType javascript,javascriptreact let b:splitjoin_join_callbacks = [
      \ 'sj#html#JoinAttributes',
      \ 'sj#html#JoinTags',
      \ 'sj#js#JoinArray',
      \ 'sj#js#JoinArgs',
      \ 'sj#js#JoinFunction',
      \ 'sj#js#JoinOneLineIf',
      \ 'sj#js#JoinObjectLiteral',
      \ ]
  autocmd FileType javascript,javascriptreact let b:delimitMate_matchpairs = "(:),[:],{:}"
  autocmd FileType javascript,javascriptreact nnoremap <silent> <buffer> ]] :call Jump('/function\\|.*=>\\|<\a')<cr>
  autocmd Filetype javascript,javascriptreact nnoremap <silent> <buffer> [[ :call Jump('?function\\|.*=>\\|<\a')<cr>
augroup END

" Enable JSDoc syntax
let g:javascript_plugin_jsdoc = 1

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
let g:vim_jsx_pretty_colorful_config = 1
let g:tagalong_additional_filetypes = ['javascript']
" }}}
" ============================= SCSS ===================================== {{{
augroup SCSS
  autocmd FileType scss setlocal sw=2
augroup END
" }}}
" ============================= HTML ===================================== {{{
" Configure closetag plugin
let g:closetag_filenames = '*.html,*.jsx,*.js,*.mjml'
" }}}
" vim:foldenable:foldmethod=marker
