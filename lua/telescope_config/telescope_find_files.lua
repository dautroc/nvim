local u = require('utils')

local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local layout_strategies = require('telescope.pickers.layout_strategies')
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-n>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-f>"] = actions.preview_scrolling_down,
        ["<C-b>"] = actions.preview_scrolling_up
      },
      n = {
        ["<esc>"] = actions.close,
        ["<C-n>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-f>"] = actions.preview_scrolling_down,
        ["<C-b>"] = actions.preview_scrolling_up
      },
    },
  }
}
