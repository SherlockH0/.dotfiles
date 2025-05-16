return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				theme = "gruvbox-material",
				component_separators = "|",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "packer", "NvimTree", "startup", "undotree", "diff", "flaggraph", "help" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str, data)
							return string.sub(str, 1, 1)
						end,
						separator = { right = "" },
						right_padding = 2,
					},
				},
				lualine_b = {
					{
						"lsp_status",
						icon = "",
						symbols = {
							done = "",
							spinner = "",
						},
					},
					{ "filetype", icon_only = true },
				},
				lualine_c = { { "filename", path = 1, newfile_status = true } },
				lualine_x = {},
				lualine_y = { "branch" },
				lualine_z = { "location", { "progress" } },
			},
			inactive_sections = {
				lualine_a = { { "filename", path = 1, newfile_status = true } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location", "progress" },
			},
			winbar = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "aerial", draw_empty = true, dense = true } },
				lualine_x = {},
				lualine_y = { "diagnostics" },
				lualine_z = {},
			},
		})
	end,
}
