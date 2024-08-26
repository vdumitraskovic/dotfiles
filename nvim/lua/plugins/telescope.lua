return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	init = function()
		local telescope = require("telescope")
		telescope.setup({
			pickers = {
				git_files = {
					show_untracked = true,
				},
			},
		})
		telescope.load_extension("fzf")
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "", builtin.git_files, { silent = true, desc = "Open Files" })
	end,
}
