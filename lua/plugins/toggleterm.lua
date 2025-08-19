return {
	"akinsho/toggleterm.nvim",
	enabled = true,
	event = "VeryLazy",
	keys = {
		{
			"<C-t>",
			"<cmd>ToggleTerm<cr>",
			desc = "ToggleTerm",
		},

		-- Default term
		{
			-- "<leader>iv",
			"<A-v>",
			"<cmd>lua require('core.functions').create_term('vertical', 'vertical')<cr>",
			desc = "Term vertical",
		},
		{
			-- "<leader>ix",
			"<A-x>",
			"<cmd>lua require('core.functions').create_term('horizontal', 'horizontal')<cr>",
			desc = "Term horizontal",
		},
		{
			-- "<leader>if",
			"<A-f>",
			"<cmd>lua require('core.functions').create_term('float', 'float')<cr>",
			desc = "Term float",
		},

		-- Custom term with name
		{
			"<leader>inv",
			"<cmd>lua require('core.functions').create_term('vertical')<cr>",
			desc = "Term vertical",
		},
		{
			"<leader>inx",
			"<cmd>lua require('core.functions').create_term('horizontal')<cr>",
			desc = "Term horizontal",
		},
		{
			"<leader>inf",
			"<cmd>lua require('core.functions').create_term('float')<cr>",
			desc = "Term float",
		},

		-- Term actions
		{
			"<leader>il",
			"<cmd>TermSelect<cr>",
			desc = "Term select",
		},
		{
			"<leader>is",
			"<cmd>ToggleTermSetName<cr>",
			desc = "Term set name",
		},
		{
			"<leader>ie",
			"<cmd>ToggleTermSendCurrentLine<cr>",
			desc = "Term execute",
		},
		{
			"<leader>ie",
			":ToggleTermSendVisualSelection<cr>",
			desc = "Term execute",
			mode = "v",
		},
	},
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return vim.o.lines * 0.3
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
				enabled = false,
				name_formatter = function(term) --  term: Terminal
					return "Terminal: " .. term.display_name
				end,
			},
		})

		-- Github Dashboard
		-- local Terminal = require("toggleterm.terminal").Terminal
		-- local GhDashboard = Terminal:new({ cmd = "gh dash", hidden = true, direction = "float" })
		-- function _gh_dash_toggle()
		-- 	GhDashboard:toggle()
		-- end
		--
		-- vim.api.nvim_set_keymap(
		-- 	"n",
		-- 	"<leader>ga",
		-- 	"<cmd>lua _gh_dash_toggle()<CR>",
		-- 	{ noremap = true, silent = true, desc = "Git dash" }
		-- )
	end,
}
