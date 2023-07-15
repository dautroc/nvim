return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>ts", "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Term send current line" },
		{ "<leader>ts", ":ToggleTermSendVisualSelection<cr>", desc = "Term send visual selection", mode = "v" },
	},
	config = function()
		-- Using protected call
		local status_ok, toggleterm = pcall(require, "toggleterm")
		if not status_ok then
			return
		end

		toggleterm.setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 20
				elseif term.direction == "vertical" then
					return (vim.o.columns * 0.5)
				end
			end,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
		})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", ";", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<CMD>NavigatorLeft<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<CMD>NavigatorDown<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<CMD>NavigatorUp<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<CMD>NavigatorRight<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    -- Handle Github dashboard
		local Terminal = require("toggleterm.terminal").Terminal
		local gh_dash = Terminal:new({
			cmd = "gh dash",
			dir = "git_dir",
			direction = "float",
			float_opts = {
				border = "double",
			},
			-- function to run on opening the terminal
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
			-- function to run on closing the terminal
			on_close = function(term)
				vim.cmd("startinsert!")
			end,
		})

		function _Github_dashboard_toggle()
			gh_dash:toggle()
		end

		vim.api.nvim_set_keymap(
			"n",
			"<leader>gd",
			"<cmd>lua _Github_dashboard_toggle()<CR>",
			{ noremap = true, silent = true, desc = "Github dashboard" }
		)
	end,
}
