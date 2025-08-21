return {
	"2kabhishek/termim.nvim",
	cmd = { "Fterm", "FTerm", "Sterm", "STerm", "Vterm", "VTerm" },
	keys = {
		{ "<A-s>", "<cmd>Sterm<cr>", desc = "Split terminal", mode = { "n", "t" } },
		{ "<A-v>", "<cmd>Vterm<cr>", desc = "Vsplit terminal", mode = { "n", "t" } },
		{ "<A-t>", "<cmd>Fterm<cr>", desc = "Tab terminal", mode = { "n", "t" } },
	},
}
