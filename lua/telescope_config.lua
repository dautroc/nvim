local u = require('utils')
u.map('n', '<C-p>', ':Telescope find_files<cr>')
u.map('n', '<C-g>', ':Telescope live_grep<cr>')
u.map('n', '<C-h>', ':Telescope help_tags<cr>')
u.map('n', '<C-r>', ':Telescope oldfiles<cr>')

local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["Q"] = actions.close,
      },
    },
  }
}
