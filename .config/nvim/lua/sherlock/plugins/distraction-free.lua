return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        width = 95,
      },
      plugins = {
        tmux = { enabled = true },
        gitsigns = { enabled = true },
      },
    },
    keys = {
      { "<leader>zm", "<cmd>ZenMode<cr>", desc = "Distraction free mode" },
    },
  },
}
