vim.keymap.set("n", "<leader><space>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<C-s>", "<cmd>:w<cr>")

vim.keymap.set("n", "", require("telescope.builtin").git_files, { desc = "Open Files" })
vim.keymap.set("n", "<leader><enter>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>ld", require("telescope.builtin").diagnostics, { desc = "Find [L]SP [d]iagnostics" })

-- Find references for the word under your cursor.
vim.keymap.set("n", "gr", function()
	require("telescope.builtin").lsp_references(require("telescope.themes").get_cursor({
		previewer = false,
	}))
end, { desc = "[G]oto [R]eferences" })

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

vim.keymap.set({ "n", "x" }, "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame" })

vim.keymap.set({ "n" }, "]g", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set({ "n" }, "[g", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
