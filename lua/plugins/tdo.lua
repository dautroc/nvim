return {
	"2kabhishek/tdo.nvim",
	dependencies = "2kabhishek/pickme.nvim",
	cmd = { "Tdo" },
	keys = {
		{ "<leader>nn", "<cmd>Tdo<cr>", desc = "Today's todo" },
		{ "<leader>ne", "<cmd>Tdo entry<cr>", desc = "Today's entry" },
		{ "<leader>nf", "<cmd>Tdo files<cr>", desc = "Today's entry" },
		{ "<leader>ns", "<cmd>Tdo search<cr>", desc = "Seach note" },
	},
  config = function()
    require("tdo").setup()
  end,
}
