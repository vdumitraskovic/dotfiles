local tree = {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

tree.config = function()
	require("nvim-tree").setup({
		view = {
			side = "right",
		},
		hijack_netrw = false,
	})
	local keyset = vim.keymap.set
	keyset("n", "<F10>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
	keyset("n", "<S-F10>", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
end

return tree
