return {
  {
    "rbong/vim-flog",
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
  {
    "tpope/vim-fugitive",
    event = { "VeryLazy" },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = false },
    event = { "VeryLazy" },
    keys = {
      { "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
      { "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle current line blame" },
    },
  },
}
