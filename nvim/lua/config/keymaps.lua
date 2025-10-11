vim.keymap.set("n", "<leader><space>", "<cmd>nohlsearch<cr>")

vim.keymap.set("n", "<leader>w", "<cmd>:w<cr>", { desc = "[W] Write" })

vim.keymap.set("n", "", function()
	require("snacks").picker.smart()
end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader><enter>", function()
	require("snacks").picker.buffers()
end, { desc = "[ ] Find existing buffers" })

vim.keymap.set("n", "<leader>ld", function()
	require("snacks").picker.diagnostics_buffer()
end, { desc = "Find [L]SP [d]iagnostics" })
