return {
	{ "mfussenegger/nvim-dap" },
	{ "lewis6991/gitsigns.nvim", config = true },
	{ "elkowar/yuck.vim", ft = "yuck" },
	{
		"theRealCarneiro/hyprland-vim-syntax",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		ft = "hypr",
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1001, -- this plugin needs to run before anything else
		opts = {
			rocks = { "magick" },
		},
	},
	{
		"3rd/image.nvim",
		dependencies = { "luarocks.nvim" },
		event = "VeryLazy",
		config = function()
			-- ...
		end,
	},
	{
		"fladson/vim-kitty",
		ft = "kitty",
		tag = "*", -- You can select a tagged version
	},
	{
		cmd = "Suda",
		"lambdalisue/suda.vim",
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
