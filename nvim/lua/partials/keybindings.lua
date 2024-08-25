-- Remap leader to '<Space>'
vim.g.mapleader = " "

local keyset = vim.keymap.set
-- Quick close help
keyset("n", "<S-F1>", ":helpclose<CR>", { noremap = true })
keyset("n", "<F13>", ":helpclose<CR>", { noremap = true })

-- Fast quit
keyset("n", "ZQ", ":qa!<cr>", { noremap = true })

-- Command mode mappings
keyset("c", "<C-a>", "<Home>", { noremap = true })
keyset("c", "<C-e>", "<End>", { noremap = true })
keyset("c", "<M-b>", "<S-Left>", { noremap = true })
keyset("c", "<M-f>", "<S-Right>", { noremap = true })

-- Highlight next/prev search result on tab
vim.opt.wildcharm = 26 -- ('<C-z>') substitute for 'wildchar' (<Tab>) in macros
keyset("c", "<Tab>", "'/?' =~ getcmdtype() ? '<C-g>' : '<C-z>'", { expr = true })
keyset("c", "<S-Tab>", [['/?' =~ getcmdtype() ? '<C-t>' : '<S-Tab>']], { expr = true, replace_keycodes = false })

-- Turn off search highlight
keyset("n", "<leader><space>", ":nohlsearch<CR>", { noremap = true })

-- Escape shortcut
keyset("i", "jk", "<Esc>", { noremap = true })

-- Easy toggle fold
keyset("n", "<S-tab>", "za", { noremap = true })

-- Buffer keys
keyset("n", "<leader>N", ":enew<CR>", { noremap = true }) -- Open a new empty buffer
keyset("n", "[b", ":bprevious<CR>", { noremap = true }) -- Move to the previous buffer
keyset("n", "]b", ":bnext<CR>", { noremap = true }) -- Move to the next buffer
keyset("n", "[B", ":bfirst<CR>", { noremap = true }) -- Move to the first buffer
keyset("n", "]B", ":blast<CR>", { noremap = true }) -- Move to the last buffer
keyset("n", "<leader>bo", ':silent execute "w|%bd|e#|bd#"<cr>', { noremap = true }) -- Close all buffers but open one
keyset("n", "<BS>", "<C-^>", { noremap = true }) -- Switch between the current and the last buffer

-- Close the current buffer and move to the previous one
-- This replicates the idea of closing a tab
keyset("n", "<leader>bd", ":bp <BAR> bd #<CR>", { noremap = true })

-- Quickfix/loclist mapping
keyset("n", "[q", ":cprevious<CR>", { noremap = true }) -- Move to the previous quickfix
keyset("n", "]q", ":cnext<CR>", { noremap = true }) -- Move to the next quickfix
keyset("n", "[Q", ":cfirst<CR>", { noremap = true }) -- Move to the first quickfix
keyset("n", "]Q", ":clast<CR>", { noremap = true }) -- Move to the last quickfix
keyset("n", "[l", ":lprevious<CR>", { noremap = true }) -- Move to the previous loclist
keyset("n", "]l", ":lnext<CR>", { noremap = true }) -- Move to the next loclist
keyset("n", "[L", ":lfirst<CR>", { noremap = true }) -- Move to the first loclist
keyset("n", "]L", ":llast<CR>", { noremap = true }) -- Move to the last loclist

-- Quick quickfix/loclist navigation
keyset("n", "<Down>", ":cnext<CR>", { noremap = true }) -- Move to the next quickfix
keyset("n", "<Up>", ":cprevious<CR>", { noremap = true }) -- Move to the previous quickfix
keyset("n", "<Right>", ":cnfile<CR>", { noremap = true }) -- Move to the next quickfix file
keyset("n", "<Left>", ":cpfile<CR>", { noremap = true }) -- Move to the previous quickfix file
keyset("n", "<S-Down>", ":lnext<CR>", { noremap = true }) -- Move to the next loclist
keyset("n", "<S-Up>", ":lprevious<CR>", { noremap = true }) -- Move to the previous loclist
keyset("n", "<S-Right>", ":lnfile<CR>", { noremap = true }) -- Move to the next loclist file
keyset("n", "<S-Left>", ":lpfile<CR>", { noremap = true }) -- Move to the previous loclist file

-- " Tabs mapping
-- " Open new tab
-- nmap <leader>T :tabnew<CR>
-- " Close tab
-- nmap <leader>tq :tabclose<CR>
-- " Move to the previous quickfix
-- nmap [t :tabprevious<CR>
-- " Move to the next quickfix
-- nmap ]t :tabnext<CR>
-- " Move to the first quickfix
-- nmap [T :tabfirst<CR>
-- " Move to the last quickfix
-- nmap ]T :tablast<CR>

-- " Tags search
-- nnoremap <leader>tl :Tags<CR>

-- " Text object motions
-- map [[ ?{<CR>w99[{
-- map ][ /}<CR>b99]}
-- map ]] j0[[%/{<CR>
-- map [] k$][%?}<CR>

-- " Replace word undercursor in whole line
-- nnoremap <Leader>r :.s/\<<C-r><C-W>\>//g<Left><Left>

-- Quickly insert an empty new line without entering insert mode
keyset("n", "<Leader>o", "o<Esc>", { noremap = true })
keyset("n", "<Leader>O", "O<Esc>", { noremap = true })

-- Quick save
keyset("n", "<C-S>", ":update<CR>", { noremap = true })
