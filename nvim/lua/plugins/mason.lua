return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		local masonlsp = require("mason-lspconfig")
		masonlsp.setup({
			ensure_installed = {
				"vtsls",
				"eslint",
			},
		})
	end,
}
