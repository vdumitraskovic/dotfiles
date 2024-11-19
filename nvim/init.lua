vim.g.mapleader = " "

vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.grepprg = "rg --smart-case --vimgrep"
vim.o.undofile = true
vim.o.foldlevel = 5

require("config.lazy")
require("config.keymaps")
