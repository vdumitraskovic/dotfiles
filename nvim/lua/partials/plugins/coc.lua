local coc = {
	"neoclide/coc.nvim",
	branch = "release",
	event = "VeryLazy",
}
coc.config = function()
	vim.g.coc_user_config = {
		coc = {
			preferences = {
				formatOnType = false,
				listOfWorkspaceEdit = "location",
				enableMessageDialog = true,
			},
		},
		javascript = {
			format = {
				insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = true,
			},
			suggestionActions = {
				enabled = true,
			},
		},
		typescript = {
			preferences = {
				importModuleSpecifier = "shortest",
			},
		},
		list = {
			source = {
				location = {
					defaultOptions = { "--number-select" },
				},
			},
		},
		codeLens = {
			enable = false,
			position = "eol",
		},
		suggest = {
			noselect = false,
			enablePreview = true,
			timeout = 10000,
			acceptSuggestionOnCommitCharacter = true,
			autoTrigger = "none",
			minTriggerInputLength = 3,
			triggerCompletionWait = 60,
		},
		diagnostic = {
			virtualText = true,
			virtualTextCurrentLineOnly = true,
			errorSign = "",
			warningSign = "",
			infoSign = "",
			hintSign = "",
		},
		eslint = {
			autoFixOnSave = true,
		},
	}

	-- " COC config
	-- let g:coc_user_config = {
	--   \ 'signature.hideOnTextChange': v:true,
	--   \ 'snippets.extends': {
	--       \ 'javascriptreact': ['javascript'],
	--       \ 'typescript': ['javascript'],
	--       \ 'typescriptreact': ['javascript']
	--   \ },
	--   \ 'emmet.includeLanguages': {
	--       \ 'javascriptreact': 'javascript'
	--   \ },
	--   \ 'eslint.autoFixOnSave': v:true,
	--   \ 'eslint.filetypes': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
	-- \ }

	vim.g.coc_global_extensions = {
		"coc-snippets",
		"coc-json",
		"coc-css",
		"coc-html",
		"coc-tag",
		"coc-tsserver",
		"coc-prettier",
		"coc-vimlsp",
		"coc-yaml",
		"coc-styled-components",
		"coc-eslint",
	}

	-- " COC
	-- augroup COC
	--   autocmd CursorHold * silent call CocActionAsync('highlight')
	--   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	-- augroup END

	-- augroup COC
	--   autocmd FileType javascript,javascriptreact,typescript,typescriptreact,json setl formatexpr=CocAction('formatSelected')
	-- augroup end

	-- Keybindings
	local keyset = vim.keymap.set
	keyset("n", "gd", "<Plug>(coc-definition)", { silent = true })
	keyset("n", "gr", "<Plug>(coc-references)", { silent = true })

	-- Use K to show documentation in preview window
	function _G.show_docs()
		local cw = vim.fn.expand("<cword>")
		if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
			vim.api.nvim_command("h " .. cw)
		elseif vim.api.nvim_eval("coc#rpc#ready()") then
			vim.fn.CocActionAsync("doHover")
		else
			vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
		end
	end
	keyset("n", "K", "<CMD>lua _G.show_docs()<CR>", { silent = true })

	-- Use `[g` and `]g` to navigate diagnostics
	-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
	keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
	keyset("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })

	-- Symbol renaming
	keyset("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })

	-- Apply codeAction to the selected region
	-- Example: `<leader>aap` for current paragraph
	local opts = { silent = true, nowait = true }
	keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
	keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

	-- Remap keys for apply code actions at the cursor position.
	keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
	-- Remap keys for apply source code actions for current file.
	keyset("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
	-- Apply the most preferred quickfix action on the current line.
	keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

	-- Remap keys for apply refactor code actions.
	keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
	keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
	keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

	-- Run the Code Lens actions on the current line
	keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)

	-- nmap <silent> <F8> :call CocAction('showOutline')<CR>
	-- nmap <silent> <leader>ic :call CocAction('showIncomingCalls')<CR>
	-- nmap <silent> <leader>oc :call CocAction('showOutgoingCalls')<CR>

	-- function ToggleCodeLens()
	--   if s:codelens
	--     let s:codelens = v:false
	--   else
	--     let s:codelens = v:true
	--   endif
	--   call coc#config('codeLens', { 'enable': s:codelens })
	--   call coc#refresh()
	-- endfunction

	-- nmap <leader>clt :call ToggleCodeLens()<CR>

	-- " Use +/- for select selections ranges, needs server support, like: coc-tsserver, coc-python
	-- vmap <silent> + <Plug>(coc-range-select)
	-- vmap <silent> - <Plug>(coc-range-select-backword)

	-- Autocomplete
	function _G.check_back_space()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
	end

	-- Use Tab for trigger completion with characters ahead and navigate
	-- NOTE: There's always a completion item selected by default, you may want to enable
	-- no select by setting `"suggest.noselect": true` in your configuration file
	-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
	-- other plugins before putting this into your config
	local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
	keyset(
		"i",
		"<TAB>",
		'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
		opts
	)
	keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
	-- Make <CR> to accept selected completion item or notify coc.nvim to format
	-- <C-g>u breaks current undo, please make your own choice
	keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
	-- Use <c-space> to trigger completion
	keyset("i", "<c-n>", "coc#pum#visible() ? coc#pum#next(1) : coc#refresh()", { silent = true, expr = true })

	-- inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : coc#refresh()

	-- inoremap <silent><expr> <TAB>
	--       \ coc#pum#visible() ? coc#pum#next(1) :
	--       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	--       \ <SID>check_back_space() ? "\<TAB>" :
	--       \ coc#refresh()

	-- function! s:check_back_space() abort
	--   let col = col('.') - 1
	--   return !col || getline('.')[col - 1]  =~# '\s'
	-- endfunction

	-- let g:coc_snippet_next = '<tab>'
end

return coc
