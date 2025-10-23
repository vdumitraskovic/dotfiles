vim.diagnostic.config({
	severity_sort = true,
	virtual_text = {
		prefix = "●",
		spacing = 4,
		current_line = true,
		virt_text_pos = "eol_right_align",
	},
	underline = {
		severity = { min = vim.diagnostic.severity.WARN },
	},
	update_in_insert = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
	},
})
