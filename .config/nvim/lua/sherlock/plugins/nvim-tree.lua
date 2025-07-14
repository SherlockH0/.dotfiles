return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  opts = {
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
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")
      local function edit_or_open()
        local node = api.tree.get_node_under_cursor()

        if node.nodes ~= nil then
          -- expand or collapse folder
          api.node.open.edit()
        else
          -- open file
          api.node.open.edit()
          -- Close the tree if file was opened
          api.tree.close()
        end
      end

      -- open as vsplit on current node
      local function vsplit_preview()
        local node = api.tree.get_node_under_cursor()

        if node.nodes ~= nil then
          -- expand or collapse folder
          api.node.open.edit()
        else
          -- open file as vsplit
          api.node.open.vertical()
        end

        -- Finally refocus on tree if it was lost
        api.tree.focus()
      end

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
      vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
      vim.keymap.set("n", "h", api.tree.close, opts("Close"))
      vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
    end,
  },
  keys = {
    { "<leader>o", "<cmd>NvimTreeToggle<CR>" },
    { "<leader>fr", "<cmd>NvimTreeRefresh<CR>" },
  },
}
