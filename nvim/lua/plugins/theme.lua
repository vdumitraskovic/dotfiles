return {
	"miikanissi/modus-themes.nvim",
	config = function()
		require("modus-themes").setup({
			dim_inactive = true,
		})
		vim.cmd([[colorscheme modus]])
	end,
	priority = 1000,
}
