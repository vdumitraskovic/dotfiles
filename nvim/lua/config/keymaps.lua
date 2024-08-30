vim.keymap.set("n", "<leader><space>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>:w<cr>")

vim.keymap.set("n", "", require("telescope.builtin").git_files, { desc = "Open Files" })
vim.keymap.set("n", "<leader><enter>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

-- Find references for the word under your cursor.
vim.keymap.set("n", "gr", function()
	require("telescope.builtin").lsp_references(require("telescope.themes").get_cursor({
		previewer = false,
	}))
end, { desc = "[G]oto [R]eferences" })

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
