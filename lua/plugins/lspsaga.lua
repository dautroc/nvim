return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	keys = {
		{ "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Lspsaga hover" },
		{ "gr", "<cmd>Lspsaga finder ref+def<cr>", desc = "Lspsaga ref+def" },
		{ "gR", "<cmd>Lspsaga rename<cr>", desc = "Lspsaga rename" },
		{ "gD", "<cmd>Lspsaga goto_definition<cr>", desc = "Lspsaga goto definition" },
		{ "gd", "<cmd>Lspsaga peek_definition<cr>", desc = "Lspsaga peek definition" },
		{ "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Lspsaga diagnosict next" },
		{ "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Lspsaga diagnosict prev" },
		{ "gA", "<cmd>Lspsaga code_action<cr>", desc = "Lspsaga code action" },
		{ "go", "<cmd>Lspsaga outline<cr>", desc = "Lspsaga outline" },
	},
	config = function()
    require("lspsaga").setup({
      finder = {
        keys = {
          edit = "o",
          vsplit = "v",
          split = "s",
          tabe = "t",
          quit = "q",
        }
      }
    })
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
