return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		-- Snippets
		{ "saadparwaiz1/cmp_luasnip" },
		{ "L3MON4D3/LuaSnip" },
		{ "rafamadriz/friendly-snippets" },
	},
	init = function()
		-- Reserve a space in the gutter
		-- This will avoid an annoying layout shift in the screen
		vim.opt.signcolumn = "yes"
	end,
	config = function()
		local lsp_defaults = require("lspconfig").util.default_config
		local lspconfig = require("lspconfig")

		lsp_defaults.capabilities =
			vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip").filetype_extend("html", { "htmldjango" })

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "gi", function()
					vim.lsp.buf.implementation()
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
				vim.keymap.set("n", "<leader>e", function()
					vim.lsp.util.show_line_diagnostics()
				end, opts)
			end,
		})
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚",
					[vim.diagnostic.severity.WARN] = "󰀪",
					[vim.diagnostic.severity.HINT] = "󰅾",
					[vim.diagnostic.severity.INFO] = "󰋽",
				},
			},
		})
		require("mason-lspconfig").setup({
			automatic_enable = true,
			automatic_installation = true,
			ensure_installed = {
				"ts_ls",
				"lua_ls",
				"tailwindcss",
				"html",
				"pyright",
				"docker_compose_language_service",
				"hyprls",
				"cssls",
				"css_variables",
				"dockerls",
				"jsonls",
				"svelte",
				"taplo",
				"volar",
				"nginx_language_server",
			},
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({})
				end,
				["html"] = function()
					lspconfig.html.setup({
						filetypes = { "html", "htmldjango" },
					})
				end,
				-- TypeScript
				["ts_ls"] = function()
					lspconfig.ts_ls.setup({
						filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = vim.fn.stdpath("data")
										.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
									languages = { "vue" },
								},
							},
						},
					})
				end,
			},
		})
	end,
}
