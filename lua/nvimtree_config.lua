local u = require('utils')
u.map('n', '<leader>v', '<CMD>:NvimTreeToggle<CR>')
u.map('n', '<leader>r', '<CMD>:NvimTreeRefresh<CR>')
u.map('n', '<leader>n', '<CMD>:NvimTreeFindFile<CR>')

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

function NvimTreeOSOpen()
  local lib = require "nvim-tree.lib"
  local node = lib.get_node_at_cursor()
  if node then
    u.fn.jobstart("open '" .. node.absolute_path .. "' &", {detach = true})
  end
end

require'nvim-tree'.setup {
	renderer = {
		highlight_git = true,
		highlight_opened_files = "all",
		special_files = { 'README.md', 'Makefile', 'MAKEFILE' },
	},
  git = {
    ignore = false
  },
  actions = {
    open_file = {
      window_picker = {
        enable =  false,
      },
    }
  },
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = true,
    custom = {}
  },
  view = {
    width = 30,
    hide_root_folder = false,
    side = 'left',
    mappings = {
      custom_only = true,
      list = {
        { key = "o",                            cb = tree_cb("edit") },
        { key = "v",                            cb = tree_cb("vsplit") },
        { key = "x",                            cb = tree_cb("split") },
        { key = "t",                            cb = tree_cb("tabnew") },
        { key = "I",                            cb = tree_cb("toggle_git_ignored") },
        { key = "H",                            cb = tree_cb("toggle_dotfiles") },
        { key = "R",                            cb = tree_cb("refresh") },
        { key = "a",                            cb = tree_cb("create") },
        { key = "d",                            cb = tree_cb("remove") },
        { key = "r",                            cb = tree_cb("rename") },
        { key = "<C-x>",                        cb = tree_cb("cut") },
        { key = "Y",                            cb = tree_cb("copy_path") },
        { key = "y",                            cb = tree_cb("copy") },
        { key = "p",                            cb = tree_cb("paste") },
        { key = "[",                            cb = tree_cb("prev_git_item") },
        { key = "]",                            cb = tree_cb("next_git_item") },
        { key = "q",                            cb = tree_cb("close") },
        { key = "g?",                           cb = tree_cb("toggle_help") },
      }
    }
  }
}
