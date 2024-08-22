return {
	"miikanissi/modus-themes.nvim",
	init = function()
		vim.cmd([[colorscheme modus]])
	end,
	priority = 1000,
}
