return {
	"2kabhishek/tdo.nvim",
	dependencies = "2kabhishek/pickme.nvim",
	cmd = { "Tdo" },
	keys = {
    -- Core
		{ "<leader>nn", "<cmd>Tdo<cr>", desc = "Today's todo" },
		{ "<leader>ne", "<cmd>Tdo entry<cr>", desc = "Today's entry" },
		{ "<leader>nf", "<cmd>Tdo files<cr>", desc = "Today's entry" },
		{ "<leader>ns", "<cmd>Tdo find<cr>", desc = "Seach note" },
		{ "<leader>nc", "<cmd>Tdo note<cr>", desc = "Create note" },
		{ "<leader>nt", "<cmd>Tdo todos<cr>", desc = "Incomplete todos" },
		{ "<leader>nx", "<cmd>Tdo toggle<cr>", desc = "Toggle todo" },

    -- Navigation
		{ "<leader>nh", "<cmd>Tdo yesterday<cr>", desc = "Yesterday's note" },
		{ "<leader>nl", "<cmd>Tdo tomorrow<cr>", desc = "Tomorrow's note" },
	},
  config = function()
    require("tdo").setup({
      add_default_keybindings = false,
    })
  end,
}
