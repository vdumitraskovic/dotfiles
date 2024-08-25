local config = function()
	vim.opt.showmode = false
	vim.g.airline_powerline_fonts = 0
	vim.g.airline_symbols_ascii = 1
	vim.g.airline_highlighting_cache = 1
	vim.g.airline_exclude_preview = 1
	vim.g.airline_focuslost_inactive = 1
end

return {
	{ "vim-airline/vim-airline", event = "VeryLazy", config = config },
	{ "vim-airline/vim-airline-themes", event = "VeryLazy" },
}
