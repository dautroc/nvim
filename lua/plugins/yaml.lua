return {
	"cuducos/yaml.nvim",
	ft = { "yaml" }, -- optional
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim", -- optional
	},
	keys = {
		{ "<leader>yt", "<cmd>lua require('yaml_nvim').telescope()<CR>", desc = "Yaml telescope" },
		{ "<leader>yv", "<cmd>lua require('yaml_nvim').view()<CR>", desc = "Yaml view" },
		{ "<leader>ya", "<cmd>lua require('yaml_nvim').yank_all()<CR>", desc = "Yaml yank all" },
		{ "<leader>yk", "<cmd>lua require('yaml_nvim').yank_key()<CR>", desc = "Yaml yank key" },
		{ "<leader>yy", "<cmd>lua require('yaml_nvim').yank_value()<CR>", desc = "Yaml yank value" },
		{ "<leader>yq", "<cmd>lua require('yaml_nvim').quickfix()<CR>", desc = "Yaml quick fix" },
	},
}
