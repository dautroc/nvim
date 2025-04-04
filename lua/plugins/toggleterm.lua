return {
	"akinsho/toggleterm.nvim",
	enabled = true,
	event = "VeryLazy",
	-- keys = {
	-- 	{
	-- 		"<C-t>",
	-- 		"<cmd>ToggleTerm<cr>",
	-- 		desc = "ToggleTerm",
	-- 	},
	--
	-- 	-- Default term
	-- 	{
	-- 		"<A-v>",
	-- 		"<cmd>lua require('core.functions').create_term('vertical', 'vertical')<cr>",
	-- 		desc = "Term vertical",
	-- 	},
	-- 	{
	-- 		"<A-x>",
	-- 		"<cmd>lua require('core.functions').create_term('horizontal', 'horizontal')<cr>",
	-- 		desc = "Term horizontal",
	-- 	},
	-- 	{
	-- 		"<A-f>",
	-- 		"<cmd>lua require('core.functions').create_term('float', 'float')<cr>",
	-- 		desc = "Term float",
	-- 	},
	--
	-- 	-- Custom term with name
	-- 	{
	-- 		"<leader>inv",
	-- 		"<cmd>lua require('core.functions').create_term('vertical')<cr>",
	-- 		desc = "Term vertical",
	-- 	},
	-- 	{
	-- 		"<leader>inx",
	-- 		"<cmd>lua require('core.functions').create_term('horizontal')<cr>",
	-- 		desc = "Term horizontal",
	-- 	},
	-- 	{
	-- 		"<leader>inf",
	-- 		"<cmd>lua require('core.functions').create_term('float')<cr>",
	-- 		desc = "Term float",
	-- 	},
	--
	-- 	-- Term actions
	-- 	{
	-- 		"<leader>il",
	-- 		"<cmd>TermSelect<cr>",
	-- 		desc = "Term select",
	-- 	},
	-- 	{
	-- 		"<leader>is",
	-- 		"<cmd>ToggleTermSetName<cr>",
	-- 		desc = "Term set name",
	-- 	},
	-- 	{
	-- 		"<A-k>",
	-- 		"<cmd>ToggleTermSendCurrentLine<cr>",
	-- 		desc = "Term execute",
	-- 	},
	-- 	{
	-- 		"<A-k>",
	-- 		":ToggleTermSendVisualSelection<cr>",
	-- 		desc = "Term execute",
	-- 		mode = "v",
	-- 	},
	-- },
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
				enabled = false,
				name_formatter = function(term) --  term: Terminal
					return "Terminal: " .. term.display_name
				end,
			},
		})

		function _G.set_terminal_keymaps()
			-- Only set keymaps if we're in a toggleterm buffer
			if vim.bo.filetype ~= "toggleterm" then
				return
			end

			local opts = { buffer = 0 }
			-- vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], opts)
			-- vim.keymap.set("t", "<c-;>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)

			-- Navigation
			-- vim.keymap.set("t", "<C-h>", [[<CMD>ZellijNavigateLeftTab<CR>]], opts)
			-- vim.keymap.set("t", "<C-j>", [[<CMD>ZellijNavigateDown<CR>]], opts)
			-- vim.keymap.set("t", "<C-k>", [[<CMD>ZellijNavigateUp<CR>]], opts)
			-- vim.keymap.set("t", "<C-l>", [[<CMD>ZellijNavigateRightTab<CR>]], opts)

      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)


			-- Toggle term
			vim.keymap.set("t", "<A-v>", [[<CMD>ToggleTerm direction=vertical name=vertical<CR>]], opts)
			vim.keymap.set("t", "<A-x>", [[<CMD>ToggleTerm direction=horizontal name=horizontal<CR>]], opts)
			vim.keymap.set("t", "<A-f>", [[<CMD>ToggleTerm direction=float name=float<CR>]], opts)
			vim.keymap.set("t", "<C-t>", [[<CMD>ToggleTerm<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

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
