local treesitter = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufRead", "BufNewFile" },
}

treesitter.config = function()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
		ensure_installed = {
			"html",
			"javascript",
			"json",
			"css",
			"gitignore",
			"bash",
			"lua",
			"markdown",
			"markdown_inline",
			"tsx",
			"typescript",
			"vim",
			"yaml",
		},
		sync_install = false,
		highlight = { enable = true, additional_vim_regex_highlighting = false },
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = ".",
				scope_incremental = false,
				node_decremental = ",",
			},
		},
	})
	vim.opt.foldmethod = "expr" -- Use treesitter for folding
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
end

return treesitter
