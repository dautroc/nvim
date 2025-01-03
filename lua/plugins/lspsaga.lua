return {
	"nvimdev/lspsaga.nvim",
  enabled = false,
	event = "LspAttach",
	keys = {
		{ "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Lspsaga hover" },
		{ "gr", "<cmd>Lspsaga finder ref<cr>", desc = "Lspsaga ref" },
		{ "gR", "<cmd>Lspsaga rename<cr>", desc = "Lspsaga rename" },
		{ "gD", "<cmd>Lspsaga goto_definition<cr>", desc = "Lspsaga goto definition" },
		{ "gd", "<cmd>Lspsaga peek_definition<cr>", desc = "Lspsaga peek definition" },
		{ "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Lspsaga diagnosict next" },
		{ "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Lspsaga diagnosict prev" },
		{ "gs", "<cmd>Lspsaga code_action<cr>", desc = "Lspsaga code action" },
		{ "go", "<cmd>Lspsaga outline<cr>", desc = "Lspsaga outline" },
	},
	config = function()
    require("lspsaga").setup({
      symbol_in_winbar = {
        enable = false,
      },
      finder = {
        keys = {
          edit = "o",
          vsplit = "v",
          split = "s",
          tabnew = "t",
          quit = "q",
          shuttle = ",w",
        }
      }
    })
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
