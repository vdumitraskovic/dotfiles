local colorscheme = {
	"reedes/vim-colors-pencil",
	lazy = false,
	priority = 1000,
}

-- function! s:tweak_theme() abort
--   let s:bg=synIDattr(synIDtrans(hlID("Normal")), "bg", "gui")
--   if g:background == 'light'
--     let s:bg_dim='#e9e9e9'
--     let g:limelight_conceal_guifg='#dddddd'
--   else
--     let s:bg_dim='#424242'
--     let g:limelight_conceal_guifg='#666666'
--   endif

--   highlight MatchParen cterm=bold gui=bold
--   highlight MatchWord cterm=bold gui=bold
-- endfunction
function _G.tweak_theme()
	vim.env.bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Normal")), "bg", "gui")

	if vim.g.background == "light" then
		vim.env.bg_dim = "#e9e9e9"
		-- let g:limelight_conceal_guifg='#dddddd'
	else
		vim.env.bg_dim = "#424242"
		-- let g:limelight_conceal_guifg='#666666'
	end

	-- vim.opt.fillchars:append("vert:│")
	-- vim.cmd([[hi VertSplit guibg=NONE ctermbg=NONE]]) -- Just show fills please

	--   highlight MatchParen cterm=bold gui=bold
	--   highlight MatchWord cterm=bold gui=bold
	vim.cmd([[
	  highlight SpelunkerSpellBad cterm=undercurl gui=undercurl
        ]])

	-- CoC tweakings
	vim.cmd([[
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
        ]])
end

colorscheme.config = function()
	vim.opt.background = vim.g.background
	vim.opt.termguicolors = true

	vim.g.enable_bold_font = 1
	vim.g.enable_italic_font = 1

	vim.g.pencil_higher_contrast_ui = 0
	vim.g.pencil_terminal_italics = 1

	vim.g.airline_theme = "pencil"
	vim.cmd.colorscheme("pencil")

	return colorscheme
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = { "*" },
	callback = function()
		_G.tweak_theme()
	end,
})

return colorscheme
