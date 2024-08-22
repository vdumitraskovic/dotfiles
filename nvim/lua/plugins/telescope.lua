return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	init = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "", builtin.git_files, { silent = true, desc = "Open Files" })
	end,
}
