local neoformat = {
	"sbdchd/neoformat",
	event = "VeryLazy",
}

neoformat.config = function()
	vim.keymap.set("n", "<F2>", ":Neoformat<CR>", { noremap = true })
	vim.keymap.set("v", "<F2>", ":'<,'>Neoformat<CR>", { noremap = true })
end

return neoformat
