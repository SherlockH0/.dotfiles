return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		opts = {
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "",
						highlight = "NvimTreeNormal",
						separator = " ", -- use a "true" to enable the default, or set your own character
					},
				},
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				custom_areas = {
					right = function()
						local result = {}
						local seve = vim.diagnostic.severity
						local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
						local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
						local info = #vim.diagnostic.get(0, { severity = seve.INFO })
						local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

						if error ~= 0 then
							table.insert(result, { text = " 󰅚 " .. error, link = "DiagnosticError" })
						end

						if warning ~= 0 then
							table.insert(result, { text = " 󰀪 " .. warning, link = "DiagnosticWarn" })
						end

						if hint ~= 0 then
							table.insert(result, { text = " 󰅾 " .. hint, link = "DiagnosticHint" })
						end

						if info ~= 0 then
							table.insert(result, { text = " 󰋽 " .. info, link = "DiagnosticInfo" })
						end
						return result
					end,
				},
			},
		},
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			options = {
				theme = "gruvbox-material",
				component_separators = "|",
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "packer", "NvimTree", "startup", "undotree", "diff", "flaggraph", "help" },
			},
			extensions = { "fugitive", "aerial", "man" },
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
					{ "filetype", icon_only = false },
				},
				lualine_c = { { "filename", path = 1, newfile_status = true } },
				lualine_x = {},
				lualine_y = { "branch", "fugitive" },
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
		},
		init = function()
			vim.api.nvim_create_autocmd({ "BufEnter", "QuitPre" }, {
				nested = false,
				callback = function(e)
					local tree = require("nvim-tree.api").tree

					-- Nothing to do if tree is not opened
					if not tree.is_visible() then
						return
					end

					-- How many focusable windows do we have? (excluding e.g. incline status window)
					local winCount = 0
					for _, winId in ipairs(vim.api.nvim_list_wins()) do
						if vim.api.nvim_win_get_config(winId).focusable then
							winCount = winCount + 1
						end
					end

					-- We want to quit and only one window besides tree is left
					if e.event == "QuitPre" and winCount == 2 then
						vim.api.nvim_cmd({ cmd = "qall" }, {})
					end

					-- :bd was probably issued an only tree window is left
					-- Behave as if tree was closed (see `:h :bd`)
					if e.event == "BufEnter" and winCount == 1 then
						-- Required to avoid "Vim:E444: Cannot close last window"
						vim.defer_fn(function()
							-- close nvim-tree: will go to the last buffer used before closing
							tree.toggle({ find_file = true, focus = true })
							-- re-open nivm-tree
							tree.toggle({ find_file = true, focus = false })
						end, 10)
					end
				end,
			})
		end,
	},
}
