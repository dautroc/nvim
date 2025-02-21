return {
	-- Automatically validate your Ghostty configuration on save
	{
		"isak102/ghostty.nvim",
		config = function()
			require("ghostty").setup()
		end,
	},
	-- Tree-sitter grammar for Ghostty configuration files
	{
		"bezhermoso/tree-sitter-ghostty",
		build = "make nvim_install",
	},
	-- Sync theme Ghostty
	{
		"landerson02/ghostty-theme-sync.nvim",
		--- @type GhosttySyncConfig
		opts = {
			ghostty_config_path = "~/.config/ghostty/config",
			persist_nvim_theme = false,
			nvim_config_path = "",
		},
	},
}
