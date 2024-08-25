local fugitive = {
	"tpope/vim-fugitive",
	event = "VeryLazy",
}
fugitive.config = function()
	-- Show git status
	vim.keymap.set("n", "<F9>", ":Git<CR>", { silent = true })
end

return fugitive
