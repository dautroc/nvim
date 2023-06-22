return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
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
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
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

		function _Lazygit_toggle()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _Lazygit_toggle()<CR>", { noremap = true, silent = true })

		for i = 1, 9 do
			vim.api.nvim_set_keymap("n", "<leader>" .. i, "<cmd>" .. i .. "ToggleTerm" .. "<CR>", {
				noremap = true,
				silent = true,
        desc = "ToggleTerm " .. i .. ""
			})
		end
	end,
}
