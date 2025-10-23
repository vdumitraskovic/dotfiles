return {
	"folke/snacks.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = false },
		dashboard = { enabled = false },
		explorer = { enabled = true, replace_netrw = true },
		indent = { enabled = false },
		input = { enabled = false },
		picker = {
			sources = {
				explorer = {
					layout = {
						layout = {
							position = "right",
						},
					},
				},
			},
		},
		notifier = { enabled = false },
		quickfile = { enabled = false },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
	keys = {
		-- File explorer mappings
		{
			"<leader>e",
			function()
				Snacks.explorer.reveal()
			end,
			desc = "File Explorer",
		},

		-- Buffer delete mappings
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
		{
			"<leader>bo",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "Delete Other Buffer(s)",
		},
	},
}
