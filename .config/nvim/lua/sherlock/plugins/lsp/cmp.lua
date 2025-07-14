return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- Autocompletes words and paths
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-nvim-lua",
    -- Adds symbols
    "onsails/lspkind.nvim",
    -- Dotenv support
    "SergioRibera/cmp-dotenv",
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")

    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    cmp.setup({
      experimental = {
        ghost_text = false,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sources = {
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lsp", priority = 8 },
        { name = "luasnip", keyword_length = 2, priority = 7 },
        { name = "buffer", keyword_length = 3, priority = 1 },
        { name = "path" },
        { name = "nvim_lua", priority = 5 },
        { name = "dotenv", priority = 2 },
        { name = "calc", priority = 3 },
      },
      sorting = {
        priority_weight = 1.0,
        comparators = {
          -- compare.score_offset, -- not good at all
          cmp.config.compare.locality,
          cmp.config.compare.recently_used,
          cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
          cmp.config.compare.offset,
          cmp.config.compare.order,
          -- cmp.config.compare.scopes, -- what?
          -- compare.sort_text,
          -- compare.exact,
          -- compare.kind,
          -- compare.length, -- useless
        },
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
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --   local luasnip = require("luasnip")
        --   local col = vim.fn.col(".") - 1
        --
        --   if cmp.visible() then
        --     cmp.select_next_item({ behavior = "select" })
        --   elseif luasnip.expand_or_locally_jumpable() then
        --     luasnip.expand_or_jump()
        --   elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        --     fallback()
        --   else
        --     cmp.complete()
        --   end
        -- end, { "i", "s" }),

        -- Super shift tab
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --   local luasnip = require("luasnip")
        --
        --   if cmp.visible() then
        --     cmp.select_prev_item({ behavior = "select" })
        --   elseif luasnip.locally_jumpable(-1) then
        --     luasnip.jump(-1)
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
      }),
    })
  end,
}
