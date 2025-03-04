return {
	{ "mfussenegger/nvim-dap" },
	{ "lewis6991/gitsigns.nvim", config = true },
	{ "elkowar/yuck.vim" },
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
		config = function()
			-- ...
		end,
	},
	"fladson/vim-kitty",
	"lambdalisue/suda.vim",
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{
		"eandrju/cellular-automaton.nvim",
		config = function()
			vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
		end,
	},
	"tpope/vim-surround",
	"qaiviq/vim-imager",
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = { char = "│", highlight = "VertSplit" },
			scope = { show_start = false, show_end = false },
		},
	},
}
