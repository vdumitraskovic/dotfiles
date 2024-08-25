local spelunker = {
	"kamykn/spelunker.vim",
	event = "VeryLazy",
}

spelunker.config = function()
	vim.g.spelunker_highlight_type = 2
	vim.g.spelunker_check_type = 2
	vim.g.spelunker_disable_auto_group = 1
	vim.api.nvim_create_autocmd({ "CursorHold" }, {
		pattern = {
			"*.lua",
			"*.js",
			"*.jsx",
			"*.ts",
			"*.tsx",
			"*.html",
			"*.css",
			"*.scss",
			"*.json",
			"*.yml",
			"*.yaml",
			"*.md",
			"*.wiki",
			"COMMIT_EDITMSG",
		},
		callback = function()
			vim.cmd("call spelunker#check_displayed_words()")
		end,
	})
end

return spelunker
