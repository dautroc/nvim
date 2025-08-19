return {
	"rmagatti/auto-session",
	enabled = true,
	lazy = false,
	keys = {
		{
			"<leader>sr",
			"<cmd>SessionRestore<CR>",
			desc = "Restore last session",
		},
		{
			"<leader>sl",
			"<cmd>lua require('auto-session.session-lens').search_session()<CR>",
			desc = "List session",
		},
		{
			"<leader>ss",
			"<cmd>SessionSave<CR>",
			desc = "Save session",
		},
	},
	config = function()
		require("auto-session").setup({
			auto_restore_last_session = false,
			git_use_branch_name = true,
      cwd_change_handling = true,
			session_lens = {
				buftypes_to_ignore = {},
				load_on_setup = true,
				picker_opts = {
					border = true,
				},
				previewer = false,
			},
			suppressed_dirs = { "~/workspace" },
		})
	end,
}
