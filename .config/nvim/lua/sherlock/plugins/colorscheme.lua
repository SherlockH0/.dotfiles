return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_float_style = "dim"
    vim.cmd.colorscheme("gruvbox-material")
    vim.g.gruvbox_material_dim_inactive_windows = 1
    vim.g.gruvbox_material_show_eob = 0
    vim.g.gruvbox_material_ui_contrast = "high"
  end,
}
