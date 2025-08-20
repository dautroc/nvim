return {
	"voldikss/vim-floaterm",
	config = function()
		-- Floaterm options
		vim.g.floaterm_shell = vim.o.shell
		vim.g.floaterm_title = "floaterm: $1/$2"
		vim.g.floaterm_wintype = "float" -- Changed to float for title visibility
		vim.g.floaterm_width = 0.8
		vim.g.floaterm_height = 0.8
		vim.g.floaterm_position = "center"
		vim.g.floaterm_borderchars = "─│─│┌┐┘└"
		vim.g.floaterm_autoclose = 1
		vim.g.floaterm_autohide = 1
		vim.g.floaterm_autoinsert = true
		vim.g.floaterm_titleposition = "right"

		-- Keymaps (normal mode)
		vim.keymap.set("n", "<A-n>", ":FloatermNew<CR>", { silent = true, desc = "Floaterm New" })
		vim.keymap.set("n", "<A-v>", ":FloatermNew --wintype=vsplit --width=0.5<CR>", { silent = true, desc = "Floaterm Vsplit" })
		vim.keymap.set(
			"n",
			"<A-x>",
			":FloatermNew --wintype=split --height=0.3<CR>",
			{ silent = true, desc = "Floaterm Split" }
		)
		vim.keymap.set("n", "<A-f>", ":FloatermNew --wintype=float<CR>", { silent = true, desc = "Floaterm Float" })
		vim.keymap.set("n", "<A-k>", ":FloatermPrev<CR>", { silent = true, desc = "Floaterm Prev" })
		vim.keymap.set("n", "<A-j>", ":FloatermNext<CR>", { silent = true, desc = "Floaterm Next" })
		vim.keymap.set("n", "<A-t>", ":FloatermToggle<CR>", { silent = true, desc = "Floaterm Toggle" })

		-- Terminal mode keymaps
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "floaterm",
			callback = function()
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], { buffer = true })

        -- Window navigation
        vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { buffer = true, silent = true, desc = "Move to left window" })
        vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { buffer = true, silent = true, desc = "Move to bottom window" })
        vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { buffer = true, silent = true, desc = "Move to top window" })
        vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { buffer = true, silent = true, desc = "Move to right window" })

        -- Floaterm management
				vim.keymap.set(
					"t",
					"<A-n>",
					"<C-\\><C-n>:FloatermNew<CR>",
					{ buffer = true, silent = true, desc = "Floaterm New" }
				)
				vim.keymap.set(
					"t",
					"<A-v>",
					"<C-\\><C-n>:FloatermNew --wintype=vsplit --width=0.5<CR>",
					{ buffer = true, silent = true, desc = "Floaterm Vsplit" }
				)
				vim.keymap.set(
					"t",
					"<A-x>",
					"<C-\\><C-n>:FloatermNew --wintype=split --height=0.3<CR>",
					{ buffer = true, silent = true, desc = "Floaterm Split" }
				)
				vim.keymap.set(
					"t",
					"<A-f>",
					"<C-\\><C-n>:FloatermNew --wintype=float<CR>",
					{ buffer = true, silent = true, desc = "Floaterm Float" }
				)
				vim.keymap.set(
					"t",
					"<A-k>",
					"<C-\\><C-n>:FloatermPrev<CR>",
					{ buffer = true, silent = true, desc = "Floaterm Prev" }
				)
				vim.keymap.set(
					"t",
					"<A-j>",
					"<C-\\><C-n>:FloatermNext<CR>",
					{ buffer = true, silent = true, desc = "Floaterm Next" }
				)
				vim.keymap.set(
					"t",
					"<A-t>",
					"<C-\\><C-n>:FloatermToggle<CR>",
					{ buffer = true, silent = true, desc = "Floaterm Toggle" }
				)
				vim.keymap.set(
					"t",
					"<A-d>",
					"<C-\\><C-n>:FloatermKill<CR>",
					{ buffer = true, silent = true, desc = "Floaterm Kill" }
				)
			end,
		})
	end,
}
