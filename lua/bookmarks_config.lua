require("bookmarks").setup({
	keymap = {
		toggle = "<leader>bb", -- toggle bookmarks
		add = "<leader>ba", -- add bookmarks
		jump = "<CR>", -- jump from bookmarks
		delete = "dd", -- delete bookmarks
		order = "<space><space>", -- order bookmarks by frequency or updated_time
	},
	width = 0.6, -- bookmarks window width:  (0, 1]
	height = 0.6, -- bookmarks window height: (0, 1]
	hl_cursorline = "guibg=Gray guifg=White" -- hl bookmarsk window cursorline
})
