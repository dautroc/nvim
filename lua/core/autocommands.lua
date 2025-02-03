vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Briefly highlight yanked text",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- TERMINAL WINDOW NAVIGATION -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Terminal window navigation
vim.cmd("autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2")

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], opts)
	-- vim.keymap.set("t", "<C-h>", [[<CMD>lua require("wezterm-move").move("h")<CR>]], opts)
	-- vim.keymap.set("t", "<C-j>", [[<CMD>lua require("wezterm-move").move("j")<CR>]], opts)
	-- vim.keymap.set("t", "<C-k>", [[<CMD>lua require("wezterm-move").move("k")<CR>]], opts)
	-- vim.keymap.set("t", "<C-l>", [[<CMD>lua require("wezterm-move").move("l")<CR>]], opts)
	vim.keymap.set("t", "<C-h>", [[<CMD>ZellijNavigateLeftTab<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<CMD>ZellijNavigateDown<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<CMD>ZellijNavigateUp<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<CMD>ZellijNavigateRightTab<CR>]], opts)

	vim.keymap.set("t", "<C-t>", [[<CMD>ToggleTerm<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- Github Dashboard
local Terminal = require("toggleterm.terminal").Terminal
local GhDashboard = Terminal:new({ cmd = "gh dash", hidden = true, direction = "float" })
function _gh_dash_toggle()
	GhDashboard:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>ga", "<cmd>lua _gh_dash_toggle()<CR>", { noremap = true, silent = true, desc = "Git dash" })

-- Automatically sync WezTerm color scheme with Neovim color scheme
-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	group = vim.api.nvim_create_augroup("wezterm_colorscheme", { clear = true }),
-- 	callback = function(args)
-- 		local colorschemes = {
-- 			-- Catppuccin
-- 			["catppuccin-frappe"] = "Catppuccin Frappe",
-- 			["catppuccin-latte"] = "Catppuccin Latte",
-- 			["catppuccin-macchiato"] = "Catppuccin Macchiato",
-- 			["catppuccin-mocha"] = "Catppuccin Mocha",
-- 		}
-- 		local colorscheme = colorschemes[args.match]
-- 		if not colorscheme then
-- 			return
-- 		end
-- 		-- Write the colorscheme to a file
-- 		local filename = vim.fn.expand("~/.config/wezterm/colorscheme")
-- 		assert(type(filename) == "string")
-- 		local file = io.open(filename, "w")
-- 		assert(file)
-- 		file:write(colorscheme)
-- 		file:close()
-- 		vim.notify("Setting WezTerm color scheme to " .. colorscheme, vim.log.levels.INFO)
-- 	end,
-- })
--

-- Auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})
