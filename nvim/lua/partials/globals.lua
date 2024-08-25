--- Global variables
vim.g.goyo_on = 0

vim.g.background = "light"
if vim.fn.filereadable(vim.fn.expand("~/.cli-theme")) == 1 then
	if vim.fn.match(vim.fn.readfile(vim.fn.expand("$HOME/.cli-theme")), "DARK") ~= -1 then
		vim.g.background = "dark"
	end
end

vim.env.bg = "#f1f1f1"
vim.env.bg_dim = "#e9e9e9"
if vim.g.background == "dark" then
	vim.env.bg = "#212121"
	vim.env.bg_dim = "#1f1f1f"
end

vim.env.codelens = false
