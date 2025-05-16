return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- Autocompletes words and paths
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		-- Adds symbols
		"onsails/lspkind.nvim",
	},
	event = "InsertEnter",
	config = function()
		local cmp = require("cmp")

		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		cmp.setup({
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "buffer", keyword_length = 3 },
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			formatting = {
				expandable_indicator = true,
				fields = { "kind", "abbr" },
				format = function(entry, item)
					require("lspkind").cmp_format({
						max_width = 30,
						ellipsis_char = "...",
						mode = "symbol",
						symbol_map = {
							Text = "󰉿 ",
							Method = "󰆧 ",
							Function = "󰊕 ",
							Constructor = " ",
							Field = "󰜢 ",
							Variable = "󰀫 ",
							Class = "󰠱 ",
							Interface = " ",
							Module = " ",
							Property = "󰜢 ",
							Unit = "󰑭 ",
							Value = "󰎠 ",
							Enum = " ",
							Keyword = "󰌋 ",
							Snippet = " ",
							Color = "󰏘 ",
							File = "󰈙 ",
							Reference = "󰈇 ",
							Folder = "󰉋 ",
							EnumMember = " ",
							Constant = "󰏿 ",
							Struct = "󰙅 ",
							Event = " ",
							Operator = "󰆕 ",
							TypeParameter = " ",
						},
					})(entry, item)
					return require("tailwindcss-colorizer-cmp").formatter(entry, item)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-e>"] = cmp.mapping.complete(),
				["<C-f>"] = cmp.mapping(function(fallback)
					local luasnip = require("luasnip")
					if luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				-- Jump to the previous snippet placeholder
				["<C-b>"] = cmp.mapping(function(fallback)
					local luasnip = require("luasnip")
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				-- Super tab
				["<Tab>"] = cmp.mapping(function(fallback)
					local luasnip = require("luasnip")
					local col = vim.fn.col(".") - 1

					if cmp.visible() then
						cmp.select_next_item({ behavior = "select" })
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
						fallback()
					else
						cmp.complete()
					end
				end, { "i", "s" }),

				-- Super shift tab
				["<S-Tab>"] = cmp.mapping(function(fallback)
					local luasnip = require("luasnip")

					if cmp.visible() then
						cmp.select_prev_item({ behavior = "select" })
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
			}),
		})
	end,
}
