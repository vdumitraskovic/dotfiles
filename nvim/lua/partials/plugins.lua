return {
	-- { "tpope/vim-sleuth", event = "VeryLazy" },
	-- { "tpope/vim-abolish", event = "VeryLazy" },
	-- { "nvim-lua/plenary.nvim" },
	-- { "stefandtw/quickfix-reflector.vim", event = "VeryLazy" },
	-- { "wakatime/vim-wakatime", event = "VeryLazy" },
	-- { "LunarVim/bigfile.nvim", lazy = false, priority = 2000 },
	-- {
	-- 	"nvimdev/indentmini.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("indentmini").setup({
	-- 			char = "▏",
	-- 		})
	-- 		vim.cmd("hi! link IndentLine IndentBlanklineChar")
	-- 		vim.cmd("hi! link IndentLineCurrent IndentBlanklineContextChar")
	-- 	end,
	-- },

	{ "LunarVim/bigfile.nvim", lazy = false, priority = 2000 },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "tpope/vim-vinegar", event = "VeryLazy" },
	{ "tpope/vim-abolish", event = "VeryLazy" },
	{
		"github/copilot.vim",
		-- It is important to load Copilot after Coc because of the keybindings
		dependencies = { "neoclide/coc.nvim" },
		event = "VeryLazy",
		config = function()
			vim.g.copilot_workspace_folders = { "~/work" }
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"markdown",
			"handlebars",
			"hbs",
		},
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	-- { 'airblade/vim-gitgutter', { 'type': 'opt' } },
	-- { 'tpope/vim-fugitive', { 'type': 'opt' } },
	-- { 'dyng/ctrlsf.vim', { 'type': 'opt' } },
	-- { 'vimwiki/vimwiki' },
	-- { 'alok/notational-fzf-vim' },
	-- { 'AndrewRadev/splitjoin.vim', { 'type': 'opt' } },
	-- { 'tpope/vim-eunuch', { 'type': 'opt' } },
	-- { 'junegunn/goyo.vim', { 'type': 'opt' } },
	-- { 'junegunn/limelight.vim' },
	-- { 'honza/vim-snippets' },
	-- { 'reedes/vim-pencil' },
	-- { 'justinmk/vim-sneak', { 'type': 'opt' } },
	-- { 'chaoren/vim-wordmotion', { 'type': 'opt' } },
	-- { 'ludovicchabant/vim-gutentags', { 'type': 'opt' } },
	-- { 'PeterRincker/vim-argumentative', { 'type': 'opt' } },
	-- { 'janko-m/vim-test', { 'type': 'opt' } },
	-- { 'tpope/vim-projectionist' },
	-- { 'editorconfig/editorconfig-vim', { 'type': 'opt' } },
	-- { 'liuchengxu/vim-which-key' },
	-- { 'zbirenbaum/copilot.lua' },
}
