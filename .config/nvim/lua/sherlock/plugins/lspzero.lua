return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"roobert/tailwindcss-colorizer-cmp.nvim",
		"onsails/lspkind.nvim",
	},

	config = function()
		local lsp_zero = require("lsp-zero")
		require("luasnip.loaders.from_vscode").lazy_load({
			exclude = { "html", "css" },
		})
		require("luasnip").filetype_extend("html", { "htmldjango" })

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
		end)
		lsp_zero.set_sign_icons({
			error = "",
			warn = "",
			hint = "󰌶",
			info = "󰋽",
		})
		-- to learn how to use mason.nvim with lsp-zero
		-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"tsserver",
				"lua_ls",
				"pyright",
				"emmet_language_server",
				"tailwindcss",
				"html",
			},
			automatic_instalation = true,
			handlers = {
				lsp_zero.default_setup,
				require("lspconfig").lua_ls.setup({
					settings = {
						Lua = {
							diagnostics = {
								-- Get the language server to recognize the `vim` global
								globals = { "vim" },
							},
						},
					},
				}),
				require("lspconfig").html.setup({
					filetypes = { "html", "htmldjango" },
				}),
				require("lspconfig").tsserver.setup({
					filetypes = { "html", "htmldjango", "javascript" },
				}),
			},
		})
		local cmp = require("cmp")
		local cmp_action = require("lsp-zero").cmp_action()
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "buffer", keyword_length = 3 },
			},
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			formatting = {
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
				["<Tab>"] = cmp_action.luasnip_supertab(),
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),
			}),
		})
	end,
}
