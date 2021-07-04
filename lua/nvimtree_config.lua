local u = require('utils')
u.map('n', '<leader>v', '<CMD>:NvimTreeToggle<CR>')
u.map('n', '<leader>r', '<CMD>:NvimTreeRefresh<CR>')
u.map('n', '<leader>n', '<CMD>:NvimTreeFindFile<CR>')

u.g.nvim_tree_git_hl = 1
u.g.nvim_tree_highlight_opened_files = 1
u.g.nvim_tree_hide_dotfiles = 1
u.g.nvim_tree_follow = 1
u.g.nvim_tree_gitignore = 1
u.g.nvim_tree_disable_window_picker = 1
u.g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' }
u.g.nvim_tree_window_picker_exclude = {
  filetype = { 'packer', 'qf' },
  buftype = { 'terminal' }
}
u.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

u.g.nvim_tree_disable_default_keybindings = 1
u.g.nvim_tree_bindings = {
  { key = "o",                            cb = tree_cb("edit") },
  { key = "v",                            cb = tree_cb("vsplit") },
  { key = "x",                            cb = tree_cb("split") },
  { key = "t",                            cb = tree_cb("tabnew") },
  { key = "I",                            cb = tree_cb("toggle_ignored") },
  { key = "H",                            cb = tree_cb("toggle_dotfiles") },
  { key = "R",                            cb = tree_cb("refresh") },
  { key = "a",                            cb = tree_cb("create") },
  { key = "d",                            cb = tree_cb("remove") },
  { key = "r",                            cb = tree_cb("rename") },
  { key = "<C->",                         cb = tree_cb("full_rename") },
  { key = "Y",                            cb = tree_cb("cut") },
  { key = "y",                            cb = tree_cb("copy") },
  { key = "p",                            cb = tree_cb("paste") },
  { key = "[",                            cb = tree_cb("prev_git_item") },
  { key = "]",                            cb = tree_cb("next_git_item") },
  { key = "q",                            cb = tree_cb("close") },
  { key = "g?",                           cb = tree_cb("toggle_help") },
}

function NvimTreeOSOpen()
  local lib = require "nvim-tree.lib"
  local node = lib.get_node_at_cursor()
  if node then
    u.fn.jobstart("open '" .. node.absolute_path .. "' &", {detach = true})
  end
end

