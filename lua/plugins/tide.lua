-- https://github.com/jackMort/tide.nvim
-- Toggle right pannel with `;` this for bookmarking files
return {
	"jackMort/tide.nvim",
  enabled = false,
	config = function()
		require("tide").setup({
			keys = {
				leader = ";", -- Leader key to prefix all Tide commands
				panel = ";", -- Open the panel (uses leader key as prefix)
				add_item = "a", -- Add a new item to the list (leader + 'a')
				delete = "d", -- Remove an item from the list (leader + 'd')
				clear_all = "c", -- Clear all items (leader + 'x')
				horizontal = "x", -- Split window horizontally (leader + '-')
				vertical = "v", -- Split window vertically (leader + '|')
			},
			animation_duration = 300, -- Animation duration in milliseconds
			animation_fps = 30, -- Frames per second for animations
			hints = {
				dictionary = "qwertzuiopsfghjklycvbnm", -- Key hints for quick access
			},
		})
	end,
	requires = {
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
}
