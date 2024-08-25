local tmux = {
	"christoomey/vim-tmux-navigator",
	event = "VeryLazy",
}
tmux.config = function()
	vim.g.tmux_navigator_no_mappings = 1

	local keyset = vim.keymap.set
	keyset("n", "<M-h>", ":TmuxNavigateLeft<cr>", { silent = true, noremap = true })
	keyset("n", "<M-j>", ":TmuxNavigateDown<cr>", { silent = true, noremap = true })
	keyset("n", "<M-k>", ":TmuxNavigateUp<cr>", { silent = true, noremap = true })
	keyset("n", "<M-l>", ":TmuxNavigateRight<cr>", { silent = true, noremap = true })
	keyset("n", "<M-\\>", ":TmuxNavigatePrevious<cr>", { silent = true, noremap = true })

	-- Disable tmux navigator when zooming the Vim pane
	vim.g.tmux_navigator_disable_when_zoomed = 1
end

return tmux
