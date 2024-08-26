return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "x" }, "<F2>", function()
			return conform.format({
				lsp_format = "fallback",
				timeout_ms = 5000,
			})
		end, { silent = true, desc = "LSP format" })
	end,
}
