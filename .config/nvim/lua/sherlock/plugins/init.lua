return {
	{ "elkowar/yuck.vim", ft = "yuck" },
	{ "wakatime/vim-wakatime", lazy = false },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = { "VeryLazy" },
		opts = {
			signs = false,
		},
	},
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {},
	},
	{
		"fladson/vim-kitty",
		ft = "kitty",
	},
	{
		"lambdalisue/suda.vim",
		cmd = "Suda",
	},
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{
		"eandrju/cellular-automaton.nvim",
		keys = {
			{ "<leader>mkr", "<cmd>CellularAutomaton make_it_rain<CR>" },
			{ "<leader>scr", "<cmd>CellularAutomaton scramble<CR>" },
			{ "<leader>gof", "<cmd>CellularAutomaton game_of_life<CR>" },
		},
	},
	{
		"tpope/vim-surround",
		event = "InsertEnter",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {
			indent = { char = "│", highlight = "VertSplit" },
			scope = { show_start = false, show_end = false },
		},
	},
}
