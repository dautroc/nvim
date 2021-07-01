local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_disable_default_keybindings = 1
vim.g.nvim_tree_bindings = {
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
    vim.fn.jobstart("open '" .. node.absolute_path .. "' &", {detach = true})
  end
end

local tree ={}
tree.open = function ()
   require'bufferline.state'.set_offset(31, 'FileTree')
   require'nvim-tree'.find_file(true)
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
end

return tree
