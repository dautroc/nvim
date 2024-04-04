return {
  'numToStr/Navigator.nvim',
  enabled = false,
  config = function()
    require('Navigator').setup()
  end
}
-- Wezterm navigator
-- keymap({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
-- keymap({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
-- keymap({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
-- keymap({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")

