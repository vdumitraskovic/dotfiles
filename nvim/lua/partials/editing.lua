-- set shortmess+=a
-- set shortmess+=c
-- set shortmess+=I
-- set shortmess+=s

-- Tab behavior
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.shiftround = true

-- Match closing bracket
vim.opt.showmatch = true

-- Show substitute results in separate preview window
vim.opt.inccommand = "split"

-- " Use prettier for formating javascript
-- let g:neoformat_enabled_javascript = ['prettierd']
-- let g:neoformat_enabled_typescript = ['prettierd']
-- let g:neoformat_enabled_javascriptreact = ['prettierd']
-- let g:neoformat_enabled_typescriptreact = ['prettierd']

-- let g:neoformat_enabled_vimwiki = ['prettier']
-- let g:neoformat_vimwiki_prettier = {
--       \ 'exe': 'prettier',
--       \ 'args': ['--prose-wrap=always', '--parser=markdown', '--stdin', '--stdin-filepath', '"%:p"'],
--       \ 'stdin': 1
--       \ }

-- " Emmet settings
-- let g:user_emmet_settings = {
-- \  'javascript.jsx' : {
-- \      'extends' : 'jsx',
-- \      'filters': 'html, bem',
-- \      'bem': {
-- \          'elementSeparator': '__',
-- \          'modifierSeparator': '--',
-- \          'shortElementPrefix': '-'
-- \      }
-- \  },
-- \  'html': {
-- \      'filters': 'html, bem'
-- \  },
-- \}

-- " Use relative path for filename completion
-- inoremap <C-X><C-F> <C-O>:lcd %:p:h<CR><C-X><C-F>

-- " Vim-wordmotion config
-- let g:wordmotion_prefix = '<Leader>'
-- let g:wordmotion_mappings = {
--       \ 'w': '<M-w>',
--       \ 'b': '<M-b>',
--       \ 'e': '<M-e>',
--       \ 'ge': '<M-ge>',
--       \ 'aw': '<M-aw>',
--       \ 'iw': '<M-iw>',
--       \ '<C-R><C-W>': '<C-R><M-w>',
--       \ }

-- " Delimate config
-- let g:delimitMate_expand_cr = 2
-- let g:delimitMate_expand_space = 1

-- " Split join config
-- let g:splitjoin_html_attributes_bracket_on_new_line = 1

-- " Codi settings
-- let g:codi#interpreters = {
--       \ 'scala': {
--         \ 'bin': 'scala',
--         \ 'prompt': 'scala> '
--         \ }
--       \ }

-- " Matchup settings
-- let g:matchup_matchparen_deferred = 1
-- let g:matchup_matchparen_nomode = 'ivV\<c-v>'
-- let g:matchup_matchparen_offscreen = {'method': 'popup'}
-- " }}}

-- " Sneak setup
-- let g:sneak#use_ic_scs = 1
-- let g:sneak#label = 1

-- Open new split panes to right and bottom, which feels more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Always use vertical diffs
vim.opt.diffopt:append("vertical")
