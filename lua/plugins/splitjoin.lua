return {
	"AndrewRadev/splitjoin.vim",
	config = function()
		vim.g.splitjoin_split_mapping = ""
		vim.g.splitjoin_join_mapping = ""

		vim.keymap.set("n", "<leader>ms", ":SplitjoinSplit<CR>", { silent = true })
		vim.keymap.set("n", "<leader>mj", ":SplitjoinJoin<CR>", { silent = true })
	end,
}
