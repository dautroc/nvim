return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
  keys = {
    { "<leader>ba", "<cmd>Grapple tag<CR>", desc = "Grapple add" },
    { "<leader>bn", "<cmd>Grapple cycle_forward<CR>", desc = "Grapple cycle forward" },
    { "<leader>bp", "<cmd>Grapple cycle_backward<CR>", desc = "Grapple cycle backward" },
    { "<leader>bl", "<cmd>Grapple open_tags<CR>", desc = "Grapple open tags" },
  },
}
