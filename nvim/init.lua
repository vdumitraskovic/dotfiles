vim.g.mapleader = " "

vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.grepprg = "rg --smart-case --vimgrep"
vim.o.undofile = true
vim.o.foldlevel = 5
vim.o.winborder = "rounded"
vim.o.breakindent = true
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.shiftround = true

require("config.lazy")
require("config.keymaps")
