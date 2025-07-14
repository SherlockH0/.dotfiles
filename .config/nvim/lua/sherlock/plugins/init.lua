return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    "3rd/image.nvim",
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      processor = "magick_cli",
      integrations = {
        markdown = {
          only_render_image_at_cursor = true,
        },
      },
      window_overlap_clear_enabled = true,
    },
  },
  {
    "declancm/cinnamon.nvim",
    version = "*", -- use latest release
    opts = {
      -- Disable the plugin
      disabled = false,

      keymaps = {
        -- Enable the provided 'basic' keymaps
        basic = true,
        -- Enable the provided 'extra' keymaps
        extra = false,
      },

      options = {
        -- The scrolling mode
        -- `cursor`: animate cursor and window scrolling for any movement
        -- `window`: animate window scrolling ONLY when the cursor moves out of view
        mode = "cursor",

        -- Only animate scrolling if a count is provided
        count_only = false,

        -- Delay between each movement step (in ms)
        delay = 5,

        max_delta = {
          -- Maximum distance for line movements before scroll
          -- animation is skipped. Set to `false` to disable
          line = false,
          -- Maximum distance for column movements before scroll
          -- animation is skipped. Set to `false` to disable
          column = false,
          -- Maximum duration for a movement (in ms). Automatically scales the
          -- delay and step size
          time = 1000,
        },

        step_size = {
          -- Number of cursor/window lines moved per step
          vertical = 1,
          -- Number of cursor/window columns moved per step
          horizontal = 2,
        },

        -- Optional post-movement callback. Not called if the movement is interrupted
        callback = function() end,
      },
    },
  },

  { "elkowar/yuck.vim", ft = "yuck" },
  { "wakatime/vim-wakatime", lazy = false },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "VeryLazy" },
    opts = {
      signs = false,
    },
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      disable_mouse = false,
    },
  },
  {
    "fladson/vim-kitty",
    ft = "kitty",
  },
  {
    "lambdalisue/suda.vim",
    cmd = { "SudaWrite", "SudaRead" },
  },
  { "christoomey/vim-tmux-navigator", lazy = false },
  {
    "eandrju/cellular-automaton.nvim",
    keys = {
      { "<leader>mkr", "<cmd>CellularAutomaton make_it_rain<CR>" },
      { "<leader>scr", "<cmd>CellularAutomaton scramble<CR>" },
      { "<leader>gof", "<cmd>CellularAutomaton game_of_life<CR>" },
    },
  },
  {
    "tpope/vim-surround",
    event = "InsertEnter",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
    opts = {
      indent = { char = "│", highlight = "VertSplit" },
      scope = { show_start = false, show_end = false },
    },
  },
}
