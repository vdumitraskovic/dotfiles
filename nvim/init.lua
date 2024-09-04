vim.g.mapleader = " "

vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.grepprg = "rg --smart-case --vimgrep"

require("config.lazy")
require("config.keymaps")
