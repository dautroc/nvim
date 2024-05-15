return {
	"nvim-orgmode/orgmode",
	event = "VeryLazy",
	ft = { "org" },
	config = function()
		-- Setup orgmode
		require("orgmode").setup({
			org_agenda_files = "~/Dropbox/orgfiles/**/*",
			org_default_notes_file = "~/Dropbox/orgfiles/refile.org",
		})
	end,
}
