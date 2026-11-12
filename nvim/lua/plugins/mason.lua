return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup({
			registries = {
				"github:mason-org/mason-registry",
				"github:Crashdummyy/mason-registry",
			},
		})
		local masonlsp = require("mason-lspconfig")
		masonlsp.setup({
			ensure_installed = {
				"eslint",
			},
		})
	end,
}
