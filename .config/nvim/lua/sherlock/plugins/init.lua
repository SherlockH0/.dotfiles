return {
	{ "lewis6991/gitsigns.nvim", config = true },
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
