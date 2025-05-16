return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- setup with some options
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
				centralize_selection = false,
			},
			renderer = {
				group_empty = true,
				highlight_diagnostics = "name",
				icons = {
					padding = "  ",
					symlink_arrow = " ➛ ",
					git_placement = "signcolumn",
					show = {
						file = true,
						folder = true,
						folder_arrow = false,
						git = true,
						modified = true,
						diagnostics = true,
						bookmarks = true,
					},
					glyphs = {
						default = "󰈤",
						symlink = "󱀱",
						bookmark = "󰃀",
						modified = "●",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "󰉋",
							open = "󰝰",
							empty = "󰉖",
							empty_open = "󰉖",
							symlink = "󰉒",
							symlink_open = "󰉒",
						},
						git = {
							unstaged = "-",
							staged = "+",
							unmerged = "",
							renamed = "»",
							untracked = "?",
							deleted = "󰩹",
							ignored = "◌",
						},
					},
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.ERROR,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			filters = {
				dotfiles = false,
			},
		})
	end,
	keys = {
		{ "<leader>o", "<cmd>NvimTreeToggle<CR>" },
		{ "<leader>fr", "<cmd>NvimTreeRefresh<CR>" },
	},
}
