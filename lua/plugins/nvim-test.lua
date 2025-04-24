return {
	"klen/nvim-test",
	keys = {
		{ "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
		{ "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test nearest" },
		{ "<leader>tl", "<cmd>TestLast<cr>", desc = "Test last" },
		{ "<leader>tv", "<cmd>TestVisit<cr>", desc = "Test visit" },
	},
	config = function()
		require("nvim-test").setup({
			run = true, -- run tests (using for debug)
			commands_create = true, -- create commands (TestFile, TestLast, ...)
			filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
			silent = false, -- less notifications
			term = "toggleterm", -- a terminal to run ("terminal"|"toggleterm")
			termOpts = {
				direction = "horizontal", -- terminal's direction ("horizontal"|"vertical"|"float")
				width = 100, -- terminal's width (for vertical|float)
				height = 30, -- terminal's height (for horizontal|float)
				go_back = true, -- return focus to original window after executing
				stopinsert = "auto", -- exit from insert mode (true|false|"auto")
				keep_one = true, -- keep only one terminal for testing
			},
			-- require("nvim-test.runners.rspec"):setup({
			-- 	command = "bundle",
			-- }),
		})
	end,
}
