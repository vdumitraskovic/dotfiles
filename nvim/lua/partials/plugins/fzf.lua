local config = function()
	-- " FZF tweaking
	-- let g:fzf_colors = {
	--   \ 'fg':      ['fg', 'Normal'],
	--   \ 'bg':      ['bg', 'TabLine'],
	--   \ 'hl':      ['fg', 'Comment'],
	--   \ 'fg+':     ['fg', 'Normal'],
	--   \ 'bg+':     ['bg', 'TabLine'],
	--   \ 'hl+':     ['fg', 'Statement'],
	--   \ 'info':    ['fg', 'CursorLine'],
	--   \ 'border':  ['fg', 'LineNr'],
	--   \ 'prompt':  ['fg', 'Conditional'],
	--   \ 'pointer': ['fg', 'Exception'],
	--   \ 'marker':  ['fg', 'Keyword'],
	--   \ 'spinner': ['fg', 'Label'],
	--   \ 'header':  ['fg', 'Comment']
	--   \  }

	-- " Using floating windows of Neovim to start fzf
	-- if has('nvim')
	--   let $FZF_DEFAULT_OPTS .= ' --border --preview-window=right:noborder --reverse --ansi --margin=0,1'

	--   function! FloatingFZF()
	--     let width = float2nr(&columns * 0.9)
	--     let height = float2nr(&lines * 0.6)
	--     let opts = { 'relative': 'editor',
	--                \ 'style': 'minimal',
	--                \ 'row': (&lines - height) / 2,
	--                \ 'col': (&columns - width) / 2,
	--                \ 'width': width,
	--                \ 'height': height }

	--     let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
	--     call setwinvar(win, '&winhighlight', 'NormalFloat:TabLine')
	--   endfunction

	--   let g:fzf_layout = { 'window': 'call FloatingFZF()' }
	-- endif

	-- " Advanced FZF ripgrep integrations
	-- command! -bang -nargs=* Rg
	--   \ call fzf#vim#grep(
	--   \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
	--   \   fzf#vim#with_preview(), <bang>0)

	-- augroup FZF
	--   autocmd! FileType fzf
	--   autocmd! FileType fzf setlocal noshowmode
	-- augroup END

	-- Keybindings
	local keyset = vim.keymap.set
	keyset("n", "<C-p>", ":Files<CR>", { silent = true, noremap = true })
	keyset("n", "<leader><CR>", ":Buffers<CR>", { silent = true, noremap = true })
	keyset("n", "<leader>l", ":Lines<CR>", { silent = true, noremap = true })
end

return {
	{ "junegunn/fzf", event = "VeryLazy", config = config },
	{ "junegunn/fzf.vim", event = "VeryLazy" },
}
