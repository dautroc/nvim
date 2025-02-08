-- Show dropbar in the top of the buffer
-- Allow navigation between buffers
-- Disabled because I don't use it
return {
	"Bekaboo/dropbar.nvim",
	enabled = false,
	-- optional, but required for fuzzy finder support
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	config = function()
		local dropbar_api = require("dropbar.api")
		vim.keymap.set("n", "<Leader>d", dropbar_api.pick, { desc = "Dropbar" })
	end,
}
