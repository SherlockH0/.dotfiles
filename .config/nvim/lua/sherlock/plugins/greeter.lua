return {
	"startup-nvim/startup.nvim",
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	event = "GUIEnter",
	config = function()
		require("startup").setup({
			header = {
				type = "text",
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "Header",
				margin = 0,
				content = {
					[[                                  __                ]],
					[[     ___     ___    ___   __  __ /\_\    ___ ___    ]],
					[[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
					[[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
					[[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
					[[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
				},
				highlight = "Tag",
				default_color = "#a9b665",
				oldfiles_amount = 0,
			},
			-- name which will be displayed and command
			body = {
				type = "mapping",
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "Basic Commands",
				margin = 5,
				content = {
					{ [[󰈔  New File    ]], "lua require'startup'.new_file()", "<leader>fn" },
					{ [[󰁯  Recent Files]], "Telescope oldfiles", "<leader>fo" },
					{ string.format("󰐱  Plugins (%s)  ", require("lazy").stats().count), "Lazy", "l" },
					{ [[󰏗  Packages    ]], "Mason", "m" },
				},
				highlight = "Delimiter",
				oldfiles_amount = 0,
			},

			options = {
				mapping_keys = true,
				cursor_column = 0.5,
				empty_lines_between_mappings = true,
				disable_statuslines = true,
				paddings = { 4, 4, 0 },
			},
			mappings = {
				execute_command = "<CR>",
				open_file = "o",
				open_file_split = "<c-o>",
				open_section = "<TAB>",
				open_help = "?",
			},
			parts = { "header", "body" },
		})
	end,
}
