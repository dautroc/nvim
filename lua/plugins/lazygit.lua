return {
	{
		"kdheepak/lazygit.nvim",
    keys = {
      {"<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit"},
      {"<leader>gc", "<cmd>LazyGitConfig<cr>", desc = "LazyGit config"},
      {
        "<leader>gf",
        "<cmd>LazyGitFilterCurrentFile<cr>",
        desc = "LazyGit filter current file",
        silent = true,
      },
    },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
