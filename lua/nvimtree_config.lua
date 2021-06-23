local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
	["<CR>"] = ":YourVimFunction()<cr>",
	["u"] = ":lua require'some_module'.some_function()<cr>",

	-- Dir up/down
	["-"]              = tree_cb("dir_up"),
	["="]              = tree_cb("cd"),

	-- Open file
	["o"]              = tree_cb("edit"),
	["v"]              = tree_cb("vsplit"),
	["x"]              = tree_cb("split"),
	["<C-t>"]          = tree_cb("tabnew"),

	-- Togle hidden files
	["I"]              = tree_cb("toggle_ignored"),
	["H"]              = tree_cb("toggle_dotfiles"),

	-- Edit
	["R"]              = tree_cb("refresh"),
	["a"]              = tree_cb("create"),
	["d"]              = tree_cb("remove"),
	["r"]              = tree_cb("rename"),
	["<C-r>"]          = tree_cb("full_rename"),
	["<C-x>"]          = tree_cb("cut"),
	["c"]              = tree_cb("copy"),
	["p"]              = tree_cb("paste"),

	-- Git items
	["]"]             = tree_cb("prev_git_item"),
	["["]             = tree_cb("next_git_item"),
	["q"]             = tree_cb("close"),
}
