return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "nvim-treesitter/nvim-treesitter-context" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			modules = {},
			ignore_install = {},
			ensure_installed = { "javascript", "python", "c", "lua", "vim", "vimdoc", "query" },

			sync_install = false,

			auto_install = true,

			indent = { enable = true },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
		require("treesitter-context").setup({})
		vim.cmd([[hi TreesitterContext gui=italic ]])
	end,
}
