-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Setup rg(ripgrep)
if vim.fn.executable("rg") then
	vim.opt.grepprg = "rg --vimgrep --smart-case -g !package-lock.json -g !yarn.lock"
	vim.opt.grepformat:append("%f:%l:%c:%m")
end

vim.api.nvim_create_user_command("Grep", "silent! grep! <args>", { nargs = '?' })

-- Auto open quickfix/location list
local search_group = vim.api.nvim_create_augroup('init_vim_search', { clear = true })
vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  pattern = '[^l]*',
  command = 'cwindow',
  nested = true,
  group = search_group,
})
vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  pattern = 'l*',
  command = 'lwindow',
  nested = true,
  group = search_group,
})

