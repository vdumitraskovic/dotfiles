return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
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
