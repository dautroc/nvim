return {
	"nvchad/showkeys",
	cmd = "ShowkeysToggle",
	opts = {
		timeout = 1,
		maxkeys = 5,
		show_count = true,

		-- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
		position = "bottom-right",
    keyformat = {
      ["<BS>"] = "󰁮 ",
      ["<CR>"] = "󰘌",
      ["<Space>"] = "󱁐",
      ["<Up>"] = "󰁝",
      ["<Down>"] = "󰁅",
      ["<Left>"] = "󰁍",
      ["<Right>"] = "󰁔",
      ["<PageUp>"] = "Page 󰁝",
      ["<PageDown>"] = "Page 󰁅",
      ["<M>"] = "Alt",
      ["<C>"] = "Ctrl",
    },
	},
	keys = {
		{ "<leader>mr", "<CMD>ShowkeysToggle<CR>", desc = "Toggle ShowKey" },
	},
}
