return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		local telescope = require("telescope")
		local themes = require("telescope.themes")

		telescope.setup({
			pickers = {
				git_files = {
					show_untracked = true,
					theme = "dropdown",
				},
				buffers = {
					theme = "dropdown",
					mappings = {
						n = {
							["<c-d>"] = require("telescope.actions").delete_buffer,
						},
						i = {
							["<c-d>"] = require("telescope.actions").delete_buffer,
						},
					},
				},
			},
			extensions = {
				["ui-select"] = {
					themes.get_cursor(),
				},
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		vim.api.nvim_create_autocmd("User", {
			pattern = "TelescopeFindPre",
			callback = function()
				vim.opt_local.winborder = "none"
				vim.api.nvim_create_autocmd("WinLeave", {
					once = true,
					callback = function()
						vim.opt_local.winborder = "rounded"
					end,
				})
			end,
		})
	end,
}
