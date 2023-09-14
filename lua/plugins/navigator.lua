-- This is for wezterm navigator
return {
	"numToStr/Navigator.nvim",
	enabled = false,
	config = function()
		require("Navigator").setup()
	end,
}
