return {
	"akinsho/toggleterm.nvim",
	enabled = true,
	event = "VeryLazy",
	keys = {
		{ "<C-t>", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" },

		-- Term direction
		{ "<leader>iv", "<cmd>lua require('core.functions').create_term('vertical')<cr>", desc = "Term vertical" },
		{ "<leader>ix", "<cmd>lua require('core.functions').create_term('horizontal')<cr>", desc = "Term horizontal" },
		{ "<leader>if", "<cmd>lua require('core.functions').create_term('float')<cr>", desc = "Term float" },

		-- Term actions
		{ "<leader>il", "<cmd>TermSelect<cr>", desc = "Term select" },
		{ "<leader>ii", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm" },
		{ "<leader>is", "<cmd>ToggleTermSetName<cr>", desc = "Term set name" },
		{ "<leader>ik", "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Term execute" },
		{
			"<leader>ik",
			":ToggleTermSendVisualSelection<cr>",
			desc = "Term execute",
			mode = "v",
		},
	},
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 20
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.5
				end
			end,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 1,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 3,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
			winbar = {
				enabled = true,
				name_formatter = function(term) --  term: Terminal
					return "Terminal: " .. term.display_name
				end,
			},
		})
	end,
}
