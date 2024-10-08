scriptencoding utf-8
" ======================= Global variables================================ {{{
let g:nvim_base = '~/.local/share/nvim/'
if has('win32')
  let g:nvim_base = '~/AppData/Local/nvim/'
endif
execute 'set runtimepath+=' . expand(g:nvim_base)
let g:goyo_on = 0
let g:background = 'light'
if filereadable(expand("~/.cli-theme")) && match(readfile(expand("$HOME/.cli-theme")),"DARK") != -1
  let g:background = 'dark'
endif
let s:bg = '#f1f1f1'
if g:background == 'dark'
  let s:bg = '#212121'
endif
let s:bg_dim = '#e9e9e9'
if g:background == 'dark'
  let s:bg_dim = '#1f1f1f'
endif
let s:codelens = v:false
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
  call packager#add('airblade/vim-gitgutter', { 'type': 'opt' })
  call packager#add('vim-airline/vim-airline', { 'type': 'opt' })
  call packager#add('vim-airline/vim-airline-themes', { 'type': 'opt' })
  call packager#add('tpope/vim-fugitive', { 'type': 'opt' })
  call packager#add('dyng/ctrlsf.vim', { 'type': 'opt' })
  call packager#add('vimwiki/vimwiki')
  call packager#add('alok/notational-fzf-vim')
  call packager#add('AndrewRadev/splitjoin.vim', { 'type': 'opt' })
  call packager#add('tpope/vim-eunuch', { 'type': 'opt' })
  call packager#add('tpope/vim-surround', { 'type': 'opt' })
  call packager#add('sbdchd/neoformat')
  call packager#add('mattn/emmet-vim', { 'type': 'opt' })
  call packager#add('tpope/tpope-vim-abolish', { 'type': 'opt' })
  call packager#add('junegunn/goyo.vim', { 'type': 'opt' })
  call packager#add('junegunn/limelight.vim')
  call packager#add('Raimondi/delimitMate', { 'type': 'opt' })
  call packager#add('honza/vim-snippets')
  call packager#add('reedes/vim-pencil')
  call packager#add('justinmk/vim-sneak', { 'type': 'opt' })
  call packager#add('mtth/scratch.vim')
  call packager#add('chaoren/vim-wordmotion', { 'type': 'opt' })
  call packager#add('ludovicchabant/vim-gutentags', { 'type': 'opt' })
  call packager#add('junegunn/fzf')
  call packager#add('junegunn/fzf.vim')
  call packager#add('PeterRincker/vim-argumentative', { 'type': 'opt' })
  call packager#add('alvan/vim-closetag', { 'type': 'opt' })
  call packager#add('scrooloose/nerdtree', { 'type': 'opt' })
  call packager#add('metakirby5/codi.vim')
  call packager#add('neoclide/coc.nvim', { 'branch': 'release' })
  call packager#add('janko-m/vim-test', { 'type': 'opt' })
  call packager#add('tpope/vim-projectionist')
  call packager#add('editorconfig/editorconfig-vim', { 'type': 'opt' })
  call packager#add('kamykn/spelunker.vim', { 'type': 'opt' })
  call packager#add('liuchengxu/vim-which-key')
  call packager#add('andymass/vim-matchup', { 'type': 'opt' })
  call packager#add('christoomey/vim-tmux-navigator')
  call packager#add('AndrewRadev/tagalong.vim')
  call packager#add('reedes/vim-colors-pencil')
  call packager#add('zbirenbaum/copilot.lua')
endfunction

" COC config
let g:coc_user_config = {
  \ 'codeLens.enable': v:false,
  \ 'codeLens.position': 'eol',
  \ 'coc.preferences.formatOnType': v:false,
  \ 'coc.preferences.listOfWorkspaceEdit': 'location',
  \ 'coc.preferences.enableMessageDialog': v:true,
  \ 'javascript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets': v:true,
  \ 'javascript.suggestionActions.enabled': v:true,
  \ 'list.source.location.defaultOptions': ['--number-select'],
  \ 'suggest.noselect': v:false,
  \ 'suggest.enablePreview': v:true,
  \ 'suggest.timeout': 10000,
  \ 'suggest.acceptSuggestionOnCommitCharacter': v:true,
  \ 'suggest.autoTrigger': 'none',
  \ 'suggest.minTriggerInputLength': 3,
  \ 'diagnostic.virtualText': v:true,
  \ 'diagnostic.virtualTextCurrentLineOnly': v:true,
  \ 'diagnostic.errorSign': '',
  \ 'diagnostic.warningSign': '',
  \ 'diagnostic.infoSign': '',
  \ 'diagnostic.hintSign': '',
  \ 'suggest.triggerCompletionWait': 60,
  \ 'signature.hideOnTextChange': v:true,
  \ 'snippets.extends': {
      \ 'javascriptreact': ['javascript'],
      \ 'typescript': ['javascript'],
      \ 'typescriptreact': ['javascript']
  \ },
  \ 'emmet.includeLanguages': {
      \ 'javascriptreact': 'javascript'
  \ },
  \ 'eslint.autoFixOnSave': v:true,
  \ 'eslint.filetypes': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
  \ 'typescript.preferences.importModuleSpecifier': 'shortest'
\ }

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-json',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-tag',
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-vimlsp',
    \ 'coc-yaml',
    \ 'coc-styled-components',
    \ 'coc-eslint',
\ ]

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

" Deferred plugins
augroup deferred_plugins
  autocmd!
  autocmd CursorHold,CursorHoldI *
        \ packadd vim-closetag |
        \ packadd ctrlsf.vim |
        \ packadd delimitMate |
        \ packadd editorconfig-vim |
        \ packadd emmet-vim |
        \ packadd goyo.vim |
        \ packadd nerdtree |
        \ packadd spelunker.vim |
        \ packadd splitjoin.vim |
        \ packadd tpope-vim-abolish |
        \ packadd vim-airline |
        \ packadd vim-airline-themes |
        \ packadd vim-argumentative |
        \ packadd vim-fugitive |
        \ packadd vim-eunuch |
        \ packadd vim-gitgutter |
        \ packadd vim-gutentags |
        \ packadd vim-matchup |
        \ packadd! vim-polyglot | runtime! ftdetect/polyglot.vim | filetype detect |
        \ packadd vim-sneak |
        \ packadd vim-surround |
        \ packadd vim-test |
        \ packadd vim-wordmotion |
        \ call luaeval('require("copilot").setup({ suggestion = { auto_trigger = true } })') |
        \ set updatetime=100 |
        \ syntax enable |
        \ call <sid>tweak_theme() |
        \ call SetGitGutter() |
        \ AirlineRefresh |
        \ doautoall BufRead |
        \ autocmd! deferred_plugins
augroup END

function! SetGitGutter() abort
  " Gitgutter
  augroup GitGutter
    " disable realtime update
    autocmd! gitgutter CursorHold,CursorHoldI
    autocmd BufWritePost * GitGutter
    GitGutterAll
    call gitgutter#setup_maps()
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

" Disable default plugins
let g:loaded_netrwPlugin = 1
let g:loaded_matchit = 1

" Vim-test
let g:test#strategy = 'make'
let g:test#javascript#reactscripts#options = '--reporters='.$HOME.'/dotfiles/jest-quickfix-reporter.js --watchAll=false'

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

if has('wsl') 
  let g:clipboard = {
        \   'name': 'myClipboard',
        \   'copy': {
        \      '+': ['win32yank.exe', '-i', '--crlf'],
        \      '*': ['win32yank.exe', '-i', '--crlf'],
        \    },
        \   'paste': {
        \      '+': ['win32yank.exe', '-o', '--lf'],
        \      '*': ['win32yank.exe', '-o', '--lf'],
        \   },
        \   'cache_enabled': 0,
      \ }
endif
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

" Configure NERDTree
let g:NERDTreeWinPos = 'right'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeCreatePrefix='silent keepalt keepjumps'
let g:NERDTreeQuitOnOpen = 0
augroup nerdtree
  autocmd FileType nerdtree setlocal bufhidden=wipe
augroup END
" }}}
" =========================== Shortcuts ================================== {{{
" Fast quit
nnoremap ZQ :qa!<cr>
" Command mode mappings
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
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
nmap <leader>bd :bp <BAR> bd #<CR>
nnoremap <leader><CR> :Buffers<CR>
nnoremap <leader>l :Lines<CR>

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

" Show git status
nnoremap <F9> :Git<CR>

" Fold git gutters
nnoremap <S-F9> :GitGutterFold<CR>

" Close loclists and quickfix and git status
nnoremap <F12> :windo lcl\|ccl\|Git\|q<CR>

" Search word under cursor
nnoremap <F7> :silent execute 'grep -w ' . expand('<cword>')<CR> <BAR> :redraw!<CR>

" Don't load Scratch window mappings
let g:scratch_no_mappings = 1

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K :call CocAction('definitionHover')<CR>
nmap <silent> <F8> :call CocAction('showOutline')<CR>
nmap <silent> <leader>ic :call CocAction('showIncomingCalls')<CR>
nmap <silent> <leader>oc :call CocAction('showOutgoingCalls')<CR>
nmap <leader>rn <Plug>(coc-rename)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Remap keys for refactor code actions.
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

function ToggleCodeLens()
  if s:codelens
    let s:codelens = v:false
  else
    let s:codelens = v:true
  endif
  call coc#config('codeLens', { 'enable': s:codelens })
  call coc#refresh()
endfunction

nmap <leader>clt :call ToggleCodeLens()<CR>

" Run the Code Lens action on the current line.
nmap <leader>cla <Plug>(coc-codelens-action)

" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use +/- for select selections ranges, needs server support, like: coc-tsserver, coc-python
vmap <silent> + <Plug>(coc-range-select)
vmap <silent> - <Plug>(coc-range-select-backword)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" COC Autocomplete/Snippets
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Vim which key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

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

" Notational-fzf-vim
nnoremap <F4> :NV<CR>
" }}}
" ======================== Visual settings =============================== {{{
set lazyredraw
set nocursorline
set nonumber
set norelativenumber
set signcolumn=number
set pumblend=10
set winblend=10

" Automatically rebalance windows on vim resize
augroup balance-windows
  autocmd VimResized * :wincmd =
augroup END

" Terminal tweaking
au TermOpen * setlocal nonumber norelativenumber
let g:terminal_color_0 = '#212121'
let g:terminal_color_8 = '#424242'
let g:terminal_color_1 = '#c30771'
let g:terminal_color_9 = '#fb007a'
let g:terminal_color_2 = '#10a778'
let g:terminal_color_10 = '#5fd7af'
let g:terminal_color_3 = '#a89c14'
let g:terminal_color_11 = '#f3e430'
let g:terminal_color_4 = '#008ec4'
let g:terminal_color_12 = '#20bbfc'
let g:terminal_color_5 = '#523c79'
let g:terminal_color_13 = '#6855de'
let g:terminal_color_6 = '#20a5ba'
let g:terminal_color_14 = '#4fb8cc'
let g:terminal_color_7 = '#d9d9d9'
let g:terminal_color_15 = '#f1f1f1'

" FZF tweaking
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'TabLine'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'Normal'],
  \ 'bg+':     ['bg', 'TabLine'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'CursorLine'],
  \ 'border':  ['fg', 'LineNr'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \  }

function! s:focus_enter()
  if g:goyo_on
    return
  endif
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
  execute "hi Normal guibg=" . s:bg
endfunction
function! s:focus_leave()
  set norelativenumber
  let w:airline_section_a = '%f'
  let w:airline_section_b = ''
  let w:airline_section_c = ''
  let w:airline_section_x = ''
  let w:airline_section_y = ''
  let w:airline_section_z = ''
  if !g:goyo_on
    execute "hi Normal guibg=" . s:bg_dim
  endif
endfunction

function s:Set_Window_BG_Colors()
  " Background colors for active vs inactive windows
  execute "hi ActiveWindow guibg=" . s:bg
  execute "hi InactiveWindow guibg=" . s:bg_dim
endfunction

function s:Unset_Window_BG_Colors()
  execute "hi ActiveWindow guibg=" . s:bg
  execute "hi InactiveWindow guibg=" . s:bg
endfunction

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd ColorScheme * call s:Set_Window_BG_Colors()
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

augroup EditorFocus
  autocmd! WinLeave * call <SID>focus_leave()
  autocmd! WinEnter * call <SID>focus_enter()
  autocmd! FocusLost * call <SID>focus_leave()
  autocmd! FocusGained * call <SID>focus_enter()
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
let g:gitgutter_max_signs = 100

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
  let s:bg=synIDattr(synIDtrans(hlID("Normal")), "bg", "gui")
  if g:background == 'light'
    let s:bg_dim='#e9e9e9'
    let g:limelight_conceal_guifg='#dddddd'
  else
    let s:bg_dim='#424242'
    let g:limelight_conceal_guifg='#666666'
  endif

  set fillchars+=vert:│
  hi VertSplit guibg=NONE ctermbg=NONE " Just show fills please
  hi SpelunkerSpellBad cterm=undercurl gui=undercurl

  highlight MatchParen cterm=bold gui=bold
  highlight MatchWord cterm=bold gui=bold

  highlight CocErrorSign ctermbg=NONE ctermfg=160 guibg=NONE guifg=#dc322f
  highlight CocErrorHighlight ctermbg=NONE ctermfg=160 gui=undercurl guibg=NONE guifg=#dc322f
  highlight CocVirtualTextError ctermfg=160 guifg=#dc322f
  highlight CocWarningSign ctermbg=NONE ctermfg=32 guibg=NONE guifg=#268bd2
  highlight CocInfoSign ctermbg=NONE ctermfg=32 guibg=NONE guifg=#268bd2
  highlight CocHintSign ctermbg=NONE ctermfg=32 guibg=NONE guifg=#268bd2
  highlight CocVirtualTextWarning ctermfg=32 guifg=#268bd2
  highlight CocInlayHint guifg=#bbbbbb
  highlight clear CocMenuSel
  highlight link CocMenuSel WildMenu
  highlight link jsxCloseString htmlTag
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
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END

" Modified from http://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! NeatFoldText()
  let indent_level = indent(v:foldstart)
  let indent = repeat(' ',indent_level)
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '-' . printf('%10s', lines_count . ' lines') . ' '
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return indent . foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()

augroup HighlightYankedText
  autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Substitute", timeout=300}
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
let g:neoformat_enabled_javascript = ['prettierd']
let g:neoformat_enabled_typescript = ['prettierd']
let g:neoformat_enabled_javascriptreact = ['prettierd']
let g:neoformat_enabled_typescriptreact = ['prettierd']

let g:neoformat_enabled_vimwiki = ['prettier']
let g:neoformat_vimwiki_prettier = {
      \ 'exe': 'prettier',
      \ 'args': ['--prose-wrap=always', '--parser=markdown', '--stdin', '--stdin-filepath', '"%:p"'],
      \ 'stdin': 1
      \ }

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
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1

" Split join config
let g:splitjoin_html_attributes_bracket_on_new_line = 1

augroup COC
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact,json setl formatexpr=CocAction('formatSelected')
augroup end

" Codi settings
let g:codi#interpreters = {
      \ 'scala': {
        \ 'bin': 'scala',
        \ 'prompt': 'scala> '
        \ }
      \ }

" Matchup settings
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_nomode = 'ivV\<c-v>'
let g:matchup_matchparen_offscreen = {'method': 'popup'}
" }}}
" =========================== Searching ================================== {{{
set ignorecase
set smartcase

" Setup rg(ripgrep) / ag (the_silver_searcher)
if executable('rg')
  set grepprg=rg\ -S\ --vimgrep\ -g\ '!tags'\ -g\ '!package-lock.json'\ -g\ '!yarn.lock'
  set grepformat^=%f:%l:%c:%m
  let g:ctrlp_user_command = ['.git', 'rg %s --files --color=never', 'rg %s --files --no-ignore']
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Disable changing of cwd when changing dir
let g:ctrlp_working_path_mode = '0'

" Using floating windows of Neovim to start fzf
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --border --preview-window=right:noborder --reverse --ansi --margin=0,1'

  function! FloatingFZF()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'style': 'minimal',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:TabLine')
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

" Advanced FZF ripgrep integrations
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

augroup FZF
  autocmd! FileType fzf
  autocmd! FileType fzf setlocal noshowmode
augroup END

" Sneak setup
let g:sneak#use_ic_scs = 1
let g:sneak#label = 1
" }}}
" ======================== Writing plugins =============================== {{{
let g:vimwiki_folding = 'syntax'
let g:vimwiki_list = [
      \ { 'path': '~/Notes', 'auto_toc': 1, 'syntax': 'markdown', 'ext': '.md' }
      \]
let g:vimwiki_toc_header_level = 2
let g:vimwiki_list_margin = 0

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
  GitGutterBufferDisable
  set nonumber
  set noshowmode
  set noshowcmd
  set laststatus=0
  let g:goyo_on = 1
  if exists('$TMUX')
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  call CocAction('diagnosticToggle', 0)
  call <SID>focus_leave()
  call <SID>Unset_Window_BG_Colors()
endfunction

function! s:goyo_leave()
  Limelight!
  set nonumber
  set showmode
  set showcmd
  set laststatus&
  if exists('$TMUX')
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  let g:goyo_on = 0
  let &background=g:background
  GitGutterBufferEnable
  call CocAction('diagnosticToggle', 1)
  call <SID>tweak_theme()
  call <SID>focus_enter()
  call <SID>Set_Window_BG_Colors()
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
  autocmd CursorHold *.vim,*.js,*.jsx,*.json,*.md,*.wiki,COMMIT_EDITMSG if expand('<afile>') != "package-lock.json" | call spelunker#check_displayed_words() | endif
augroup END

" Notational FZF
let g:nv_search_paths = ['~/Notes/']
let g:nv_window_direction = 'call FloatingFZF()'
let g:nv_preview_direction = 'up'
let g:nv_default_extension = '.wiki'
" }}}
" ========================== Javascript ================================== {{{
augroup JavaScript
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
  " Setup errorformat for Jest
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal errorformat=%f:%l:%c:\ %m
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact let b:splitjoin_split_callbacks = [
      \ 'sj#html#SplitTags',
      \ 'sj#html#SplitAttributes',
      \ 'sj#js#SplitArray',
      \ 'sj#js#SplitObjectLiteral',
      \ 'sj#js#SplitFunction',
      \ 'sj#js#SplitOneLineIf',
      \ 'sj#js#SplitArgs'
      \ ]

  autocmd FileType javascript,javascriptreact,typescript,typescriptreact let b:splitjoin_join_callbacks = [
      \ 'sj#html#JoinAttributes',
      \ 'sj#html#JoinTags',
      \ 'sj#js#JoinArray',
      \ 'sj#js#JoinArgs',
      \ 'sj#js#JoinFunction',
      \ 'sj#js#JoinOneLineIf',
      \ 'sj#js#JoinObjectLiteral',
      \ ]
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact let b:delimitMate_matchpairs = "(:),[:],{:}"
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact nnoremap <silent> <buffer> ]] :call Jump('/function\\|.*=>\\|<\a')<cr>
  autocmd Filetype javascript,javascriptreact,typescript,typescriptreact nnoremap <silent> <buffer> [[ :call Jump('?function\\|.*=>\\|<\a')<cr>
augroup END

" Enable JSDoc syntax
let g:javascript_plugin_jsdoc = 1

" Javascript lib syntax setup
let g:used_javascript_libs = 'underscore,react,ramda'

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

" Gutentags JS sub project
let g:gutentags_project_root = ['node_modules']
" }}}
" ============================= SCSS ===================================== {{{
augroup SCSS
  autocmd FileType scss setlocal sw=2
augroup END
" }}}
" ============================= HTML ===================================== {{{
" Configure closetag plugin
let g:closetag_filenames = '*.html,*.jsx,*.js,*.ts,*.tsx'
" }}}
" vim:foldenable:foldmethod=marker
