return {
  "lommix/godot.nvim",
  ft = { "gdscript" },
  config = function()
    local godot = require("godot")
    godot.setup({
      bin = "godot",
    })
    vim.keymap.set("n", "<leader>dr", godot.debugger.debug)
    vim.keymap.set("n", "<leader>dd", godot.debugger.debug_at_cursor)
    vim.keymap.set("n", "<leader>dq", godot.debugger.quit)
    vim.keymap.set("n", "<leader>dc", godot.debugger.continue)
    vim.keymap.set("n", "<leader>ds", godot.debugger.step)
  end,
}
