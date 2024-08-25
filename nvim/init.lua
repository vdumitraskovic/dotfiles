require('partials.globals')
require('partials.settings')
require('partials.keybindings')
require('partials.editing')
require('partials.searching');
require('partials.fold')
require('partials.lazy');

-- TODO
-- Sneak
-- Surround
-- Theme
--  tweak theme
--  dim unused windows
-- polyglot
-- Goyo
-- CoC
-- Replace FZF with telescope
-- Copilot
-- Treesitter theme

-- " Deferred plugins
-- augroup deferred_plugins
--   autocmd!
--   autocmd CursorHold,CursorHoldI *
--         \ packadd vim-closetag |
--         \ packadd ctrlsf.vim |
--         \ packadd delimitMate |
--         \ packadd editorconfig-vim |
--         \ packadd emmet-vim |
--         \ packadd goyo.vim |
--         \ packadd spelunker.vim |
--         \ packadd splitjoin.vim |
--         \ packadd tpope-vim-abolish |
--         \ packadd vim-argumentative |
--         \ packadd vim-fugitive |
--         \ packadd vim-eunuch |
--         \ packadd vim-gitgutter |
--         \ packadd vim-gutentags |
--         \ packadd vim-matchup |
--         \ packadd! vim-polyglot | runtime! ftdetect/polyglot.vim | filetype detect |
--         \ packadd vim-sneak |
--         \ packadd vim-surround |
--         \ packadd vim-test |
--         \ packadd vim-wordmotion |
--         \ call luaeval('require("copilot").setup({ suggestion = { auto_trigger = true } })') |
--         \ set updatetime=100 |
--         \ syntax enable |
--         \ call <sid>tweak_theme() |
--         \ call SetGitGutter() |
--         \ AirlineRefresh |
--         \ doautoall BufRead |
--         \ autocmd! deferred_plugins
-- augroup END

-- function! SetGitGutter() abort
--   " Gitgutter
--   augroup GitGutter
--     " disable realtime update
--     autocmd! gitgutter CursorHold,CursorHoldI
--     autocmd BufWritePost * GitGutter
--     GitGutterAll
--     call gitgutter#setup_maps()
--   augroup END
-- endfunction
-- " }}}
-- " ============================ General =================================== {{{{{{
-- set ttimeout
-- set ttimeoutlen=100
-- set updatetime=500
-- set synmaxcol=200
-- set mouse=a
-- set switchbuf=usetab
-- syntax off

-- " Disable default plugins
-- let g:loaded_netrwPlugin = 1
-- let g:loaded_matchit = 1

-- " Vim-test
-- let g:test#strategy = 'make'
-- let g:test#javascript#reactscripts#options = '--reporters='.$HOME.'/dotfiles/jest-quickfix-reporter.js --watchAll=false'


-- " Terminal tweakings
-- augroup terminal
--   autocmd TermOpen * startinsert
-- augroup end

-- function! Jump(motion) range
--   let cnt = v:count1
--   let save = getreg('/')
--   mark '
--   while cnt > 0
--     silent! execute a:motion
--     let cnt = cnt - 1
--   endwhile
--   call histdel('/', -1)
--   call setreg('/', save)
-- endfunction

-- if has('wsl') 
--   let g:clipboard = {
--         \   'name': 'myClipboard',
--         \   'copy': {
--         \      '+': ['win32yank.exe', '-i', '--crlf'],
--         \      '*': ['win32yank.exe', '-i', '--crlf'],
--         \    },
--         \   'paste': {
--         \      '+': ['win32yank.exe', '-o', '--lf'],
--         \      '*': ['win32yank.exe', '-o', '--lf'],
--         \   },
--         \   'cache_enabled': 0,
--       \ }
-- endif
-- " }}}}}}
-- " ======================= Files and folders=============================== {{{
-- set fileformats=unix,dos
-- set path+=src,src/**,frontend,frontend/**
-- set undofile
-- set backupcopy=yes
-- exec 'set undodir=' . g:nvim_base . 'undodir'

-- " Automatically reload file
-- set noswapfile
-- set nowritebackup
-- set nobackup
-- set autoread
-- augroup autoreload
--   autocmd FocusGained,CursorHold ?* if getcmdwintype() == '' | checktime | endif
-- augroup END

-- " Specify files to ignore on wildmenu
-- set wildignore+=.git
-- set wildignore+=node_modules,bower_components
-- set wildignore+=dist

-- " =========================== Shortcuts ================================== {{{

-- set pastetoggle=<F3>

-- " Goyo
-- nnoremap <F11> :Goyo<CR>

-- " Fold git gutters
-- nnoremap <S-F9> :GitGutterFold<CR>

-- " Close loclists and quickfix and git status
-- nnoremap <F12> :windo lcl\|ccl\|Git\|q<CR>

-- " Search word under cursor
-- nnoremap <F7> :silent execute 'grep -w ' . expand('<cword>')<CR> <BAR> :redraw!<CR>

-- " Don't load Scratch window mappings
-- let g:scratch_no_mappings = 1

-- " COC
-- " Vim which key
-- nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

-- " Zoom a vim pane, <C-w>= to re-balance
-- nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
-- nnoremap <leader>= :wincmd =<cr>

-- " Window movement
-- nnoremap <M-h> <C-w>h
-- nnoremap <M-j> <C-w>j
-- nnoremap <M-k> <C-w>k
-- nnoremap <M-l> <C-w>l

-- " Terminal mappings
-- tnoremap <M-[> <C-\><C-n>
-- tnoremap <M-h> <C-\><C-n><C-w>h
-- tnoremap <M-j> <C-\><C-n><C-w>j
-- tnoremap <M-k> <C-\><C-n><C-w>k
-- tnoremap <M-l> <C-\><C-n><C-w>l

-- " Insert mode movement
-- inoremap <M-l> <C-o>l
-- inoremap <M-h> <C-o>h
-- inoremap <M-j> <C-o>j
-- inoremap <M-k> <C-o>k

-- " Create folders as needed
-- cnoremap mk. !mkdir -p <c-r>=expand("%:h")<cr>

-- " Alternate "nonumber | number | relativenumber"
-- nnoremap <leader>n :let [&nu, &rnu] = [!&rnu, &nu+&rnu==1]<cr>

-- " CtrlSF shortcut
-- nmap <S-F7> <Plug>CtrlSFCwordExec
-- nmap <F19> <Plug>CtrlSFCwordExec

-- " Toggle syntax
-- function! ToggleSyntax()
--   if exists('b:old_syntax')
--     let &l:syntax=b:old_syntax
--     unlet b:old_syntax
--   else
--     let b:old_syntax=&l:syntax
--     set syntax=
--   endif
-- endfunction
-- nnoremap <leader>S :call ToggleSyntax()<cr>

-- " Easy repeat macro
-- nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

-- " Notational-fzf-vim
-- nnoremap <F4> :NV<CR>
-- " }}}
-- " ======================== Visual settings =============================== {{{
-- set lazyredraw
-- set nocursorline
-- set nonumber
-- set norelativenumber
-- set signcolumn=number

-- " Automatically rebalance windows on vim resize
-- augroup balance-windows
--   autocmd VimResized * :wincmd =
-- augroup END

-- " Terminal tweaking
-- au TermOpen * setlocal nonumber norelativenumber
-- let g:terminal_color_0 = '#212121'
-- let g:terminal_color_8 = '#424242'
-- let g:terminal_color_1 = '#c30771'
-- let g:terminal_color_9 = '#fb007a'
-- let g:terminal_color_2 = '#10a778'
-- let g:terminal_color_10 = '#5fd7af'
-- let g:terminal_color_3 = '#a89c14'
-- let g:terminal_color_11 = '#f3e430'
-- let g:terminal_color_4 = '#008ec4'
-- let g:terminal_color_12 = '#20bbfc'
-- let g:terminal_color_5 = '#523c79'
-- let g:terminal_color_13 = '#6855de'
-- let g:terminal_color_6 = '#20a5ba'
-- let g:terminal_color_14 = '#4fb8cc'
-- let g:terminal_color_7 = '#d9d9d9'
-- let g:terminal_color_15 = '#f1f1f1'

-- function! s:focus_enter()
--   if g:goyo_on
--     return
--   endif
--   if &l:number
--     set relativenumber
--   endif
--   if exists('g:airline_section_a')
--     let w:airline_section_a = g:airline_section_a
--     let w:airline_section_b = g:airline_section_b
--     let w:airline_section_c = g:airline_section_c
--     let w:airline_section_x = g:airline_section_x
--     let w:airline_section_y = g:airline_section_y
--     let w:airline_section_z = g:airline_section_z
--   endif
--   execute "hi Normal guibg=" . s:bg
-- endfunction
-- function! s:focus_leave()
--   set norelativenumber
--   let w:airline_section_a = '%f'
--   let w:airline_section_b = ''
--   let w:airline_section_c = ''
--   let w:airline_section_x = ''
--   let w:airline_section_y = ''
--   let w:airline_section_z = ''
--   if !g:goyo_on
--     execute "hi Normal guibg=" . s:bg_dim
--   endif
-- endfunction

-- function s:Set_Window_BG_Colors()
--   " Background colors for active vs inactive windows
--   execute "hi ActiveWindow guibg=" . s:bg
--   execute "hi InactiveWindow guibg=" . s:bg_dim
-- endfunction

-- function s:Unset_Window_BG_Colors()
--   execute "hi ActiveWindow guibg=" . s:bg
--   execute "hi InactiveWindow guibg=" . s:bg
-- endfunction

-- " Call method on window enter
-- augroup WindowManagement
--   autocmd!
--   autocmd ColorScheme * call s:Set_Window_BG_Colors()
--   autocmd WinEnter * call Handle_Win_Enter()
-- augroup END

-- " Change highlight group of active/inactive windows
-- function! Handle_Win_Enter()
--   setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
-- endfunction

-- augroup EditorFocus
--   autocmd! WinLeave * call <SID>focus_leave()
--   autocmd! WinEnter * call <SID>focus_enter()
--   autocmd! FocusLost * call <SID>focus_leave()
--   autocmd! FocusGained * call <SID>focus_enter()
-- augroup END

-- set wildignorecase

-- " Tweak diff
-- set diffopt+=algorithm:histogram,indent-heuristic


-- " Auto open quickfix
-- augroup QuickFix
--   autocmd QuickFixCmdPost [^l]* nested cwindow
-- augroup END

-- set list

-- let g:gitgutter_override_sign_column_highlight = 1
-- let g:gitgutter_max_signs = 100

-- " Colorize vimwiki headers
-- let g:vimwiki_hl_headers = 1

-- augroup vimreload
--   autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
-- augroup end

-- " WhichKey tweak
-- augroup which-key-overrides
--   " autocmd FileType which_key highlight WhichKeySeperator guibg=NONE ctermbg=NONE
-- augroup END

-- " Modified from http://dhruvasagar.com/2013/03/28/vim-better-foldtext
-- function! NeatFoldText()
--   let indent_level = indent(v:foldstart)
--   let indent = repeat(' ',indent_level)
--   let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
--   let lines_count = v:foldend - v:foldstart + 1
--   let lines_count_text = '-' . printf('%10s', lines_count . ' lines') . ' '
--   let foldchar = matchstr(&fillchars, 'fold:\zs.')
--   let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
--   let foldtextend = lines_count_text . repeat(foldchar, 8)
--   let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
--   return indent . foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
-- endfunction
-- set foldtext=NeatFoldText()

-- augroup HighlightYankedText
--   autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="Substitute", timeout=300}
-- augroup END
-- " }}}
-- " ======================== Writing plugins =============================== {{{
-- let g:vimwiki_folding = 'syntax'
-- let g:vimwiki_list = [
--       \ { 'path': '~/Notes', 'auto_toc': 1, 'syntax': 'markdown', 'ext': '.md' }
--       \]
-- let g:vimwiki_toc_header_level = 2
-- let g:vimwiki_list_margin = 0

-- function! VimwikiLinkHandler(link)
--   " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
--   "   1) [[vfile:~/Code/PythonProject/abc123.py]]
--   "   2) [[vfile:./|Wiki Home]]
--   let link = a:link
--   if link =~# '^vfile:'
--     let link = link[1:]
--   else
--     return 0
--   endif
--   let link_infos = vimwiki#base#resolve_link(link)
--   if link_infos.filename ==# ''
--     echomsg 'Vimwiki Error: Unable to resolve link!'
--     return 0
--   else
--     exe 'edit ' . fnameescape(link_infos.filename)
--     return 1
--   endif
-- endfunction

-- " Goyo + Limelight
-- function! s:goyo_enter()
--   Limelight
--   GitGutterBufferDisable
--   set nonumber
--   set noshowmode
--   set noshowcmd
--   set laststatus=0
--   let g:goyo_on = 1
--   if exists('$TMUX')
--     silent !tmux set status off
--     silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
--   endif
--   call CocAction('diagnosticToggle', 0)
--   call <SID>focus_leave()
--   call <SID>Unset_Window_BG_Colors()
-- endfunction

-- function! s:goyo_leave()
--   Limelight!
--   set nonumber
--   set showmode
--   set showcmd
--   set laststatus&
--   if exists('$TMUX')
--     silent !tmux set status on
--     silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
--   endif
--   let g:goyo_on = 0
--   let &background=g:background
--   GitGutterBufferEnable
--   call CocAction('diagnosticToggle', 1)
--   call <SID>tweak_theme()
--   call <SID>focus_enter()
--   call <SID>Set_Window_BG_Colors()
-- endfunction

-- augroup Goyo
--   autocmd! User GoyoEnter nested call <SID>goyo_enter()
--   autocmd! User GoyoLeave nested call <SID>goyo_leave()
-- augroup END

-- augroup pencil
--   autocmd!
--   autocmd FileType markdown,mkd call pencil#init()
--   autocmd FileType text         call pencil#init()
--   autocmd FileType vimwiki      call pencil#init({'autoformat': 0})
-- augroup END

-- " Notational FZF
-- let g:nv_search_paths = ['~/Notes/']
-- let g:nv_window_direction = 'call FloatingFZF()'
-- let g:nv_preview_direction = 'up'
-- let g:nv_default_extension = '.wiki'
-- " }}}
-- " ========================== Javascript ================================== {{{
-- augroup JavaScript
--   autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal include=^\\s*[^\/]\\+\\(from\\\|require(['\"]\\)
--   " Setup errorformat for Jest
--   autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal errorformat=%f:%l:%c:\ %m
--   autocmd FileType javascript,javascriptreact,typescript,typescriptreact let b:splitjoin_split_callbacks = [
--       \ 'sj#html#SplitTags',
--       \ 'sj#html#SplitAttributes',
--       \ 'sj#js#SplitArray',
--       \ 'sj#js#SplitObjectLiteral',
--       \ 'sj#js#SplitFunction',
--       \ 'sj#js#SplitOneLineIf',
--       \ 'sj#js#SplitArgs'
--       \ ]

--   autocmd FileType javascript,javascriptreact,typescript,typescriptreact let b:splitjoin_join_callbacks = [
--       \ 'sj#html#JoinAttributes',
--       \ 'sj#html#JoinTags',
--       \ 'sj#js#JoinArray',
--       \ 'sj#js#JoinArgs',
--       \ 'sj#js#JoinFunction',
--       \ 'sj#js#JoinOneLineIf',
--       \ 'sj#js#JoinObjectLiteral',
--       \ ]
--   autocmd FileType javascript,javascriptreact,typescript,typescriptreact let b:delimitMate_matchpairs = "(:),[:],{:}"
--   autocmd FileType javascript,javascriptreact,typescript,typescriptreact nnoremap <silent> <buffer> ]] :call Jump('/function\\|.*=>\\|<\a')<cr>
--   autocmd Filetype javascript,javascriptreact,typescript,typescriptreact nnoremap <silent> <buffer> [[ :call Jump('?function\\|.*=>\\|<\a')<cr>
-- augroup END

-- " Enable JSDoc syntax
-- let g:javascript_plugin_jsdoc = 1

-- " Javascript lib syntax setup
-- let g:used_javascript_libs = 'underscore,react,ramda'

-- " Tagbar setup
-- let g:tagbar_type_javascript = {
--     \ 'ctagsbin': 'ctags',
--     \ 'kinds' : [
--         \ 'v:global variables',
--         \ 'f:functions',
--         \ '?:unknown',
--         \ 'C:constants',
--         \ 'c:classes',
--         \ 'm:methods',
--         \ 'p:properties',
--         \ 'g:generators',
--     \ ],
-- \ }
-- let g:vim_jsx_pretty_colorful_config = 1
-- let g:tagalong_additional_filetypes = ['javascript']

-- " Gutentags JS sub project
-- let g:gutentags_project_root = ['node_modules']
-- " }}}
-- " ============================= SCSS ===================================== {{{
-- augroup SCSS
--   autocmd FileType scss setlocal sw=2
-- augroup END
-- " }}}
-- " ============================= HTML ===================================== {{{
-- " Configure closetag plugin
-- let g:closetag_filenames = '*.html,*.jsx,*.js,*.ts,*.tsx'
-- " }}}
-- " vim:foldenable:foldmethod=marker
