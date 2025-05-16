vim.keymap.set("n", "<leader><space>", "<cmd>nohlsearch<cr>")

vim.keymap.set("n", "<leader>w", "<cmd>:w<cr>", { desc = "[W] Write" })

vim.keymap.set("n", "", require("telescope.builtin").git_files, { desc = "Open Files" })
vim.keymap.set("n", "<leader><enter>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>ld", require("telescope.builtin").diagnostics, { desc = "Find [L]SP [d]iagnostics" })
