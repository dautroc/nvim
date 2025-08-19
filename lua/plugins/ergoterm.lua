return {
	"waiting-for-dev/ergoterm.nvim",
	enabled = false,
	config = function()
		require("ergoterm").setup({
			-- Terminal defaults - applied to all new terminals but overridable per instance
			terminal_defaults = {
				-- Default shell command
				shell = vim.o.shell,

				-- Default window layout
				layout = "below",

				-- Auto-scroll terminal output
				auto_scroll = true,

				-- Close terminal window when job exits
				close_on_job_exit = true,

				-- Remember terminal mode between visits
				persist_mode = false,

				-- Start terminals in insert mode
				start_in_insert = true,

				-- Show terminals in picker by default
				selectable = true,

				-- Keep terminals visible in picker even when stopped, provided `selectable` is also true
				sticky = false,

				-- Floating window options
				float_opts = {
					title_pos = "left",
					relative = "editor",
					border = "single",
					zindex = 50,
				},

				-- Floating window transparency
				float_winblend = 10,

				-- Size configuration for different layouts
				size = {
					below = "30%", -- 50% of screen height
					above = "50%", -- 50% of screen height
					left = "50%", -- 50% of screen width
					right = "50%", -- 50% of screen width
				},

				-- Clean job environment
				clear_env = false,

				-- Environment variables for terminal jobs
				env = nil, -- Example: { PATH = "/custom/path", DEBUG = "1" }

				-- Default callbacks (all no-ops by default)
				-- on_close = function(term) end,
				-- on_create = function(term) end,
				-- on_focus = function(term) end,
				-- on_job_exit = function(term, job_id, exit_code, event_name) end,
				-- on_job_stderr = function(term, channel_id, data_lines, stream_name) end,
				-- on_job_stdout = function(term, channel_id, data_lines, stream_name) end,
				-- on_open = function(term) end,
				-- on_start = function(term) end,
				-- on_stop = function(term) end,
			},

			-- Picker configuration
			picker = {
				-- Picker to use for terminal selection
				-- Can be "telescope", "fzf-lua", "vim-ui-select", or a custom picker object
				-- nil = auto-detect (telescope > fzf-lua > vim.ui.select)
				picker = "telescope",

				-- Default actions available in terminal picker
				-- These replace the built-in actions entirely
				select_actions = {
					default = {
						fn = function(term)
							term:focus()
						end,
						desc = "Open",
					},
					["<C-s>"] = {
						fn = function(term)
							term:focus("below")
						end,
						desc = "Open in horizontal split",
					},
					["<C-v>"] = {
						fn = function(term)
							term:focus("right")
						end,
						desc = "Open in vertical split",
					},
					["<C-t>"] = {
						fn = function(term)
							term:focus("tab")
						end,
						desc = "Open in tab",
					},
					["<C-f>"] = {
						fn = function(term)
							term:focus("float")
						end,
						desc = "Open in float window",
					},
				},

				-- Additional actions to append to select_actions
				-- These are merged with select_actions, allowing you to add custom actions
				-- without replacing the defaults
				extra_select_actions = {},
			},
		})

		-- Key mappings for terminal management
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }
		local terms = require("ergoterm.terminal")

		-- Create terminals with different layouts
		map("n", "<leader>ks", function()
			terms.Terminal:new({ layout = "below" }):toggle()
		end, opts)

		map("n", "<leader>kv", function()
			terms.Terminal:new({ layout = "right" }):toggle()
		end, opts)

		map("n", "<leader>kf", function()
			terms.Terminal:new({ layout = "float" }):toggle()
		end, opts)

		map("n", "<leader>kt", function()
			terms.Terminal:new({ layout = "tab" }):toggle()
		end, opts)

		-- Open terminal picker
		map("n", "<leader>kl", function()
			require("ergoterm.picker").select()
		end, opts)

		-- Send current line to last focused terminal (without newline)
		-- map("n", "<leader>ks", function()
		-- 	local term = terms.get_last_focused()
		-- 	if term then
		-- 		term:send("single_line", { new_line = false })
		-- 	end
		-- end, opts)

		-- Send visual selection to last focused terminal (without newline)
		-- map("x", "<leader>ks", function()
		-- 	local term = terms.get_last_focused()
		-- 	if term then
		-- 		term:send("visual_selection", { new_line = false })
		-- 	end
		-- end, opts)

		-- Send current line to last focused terminal, show output but keep focus
		-- map("n", "<leader>kx", function()
		-- 	local term = terms.get_last_focused()
		-- 	if term then
		-- 		term:send("single_line", { action = "visible" })
		-- 	end
		-- end, opts)

		-- Send visual selection to last focused terminal, show output but keep focus
		-- map("x", "<leader>kx", function()
		-- 	local term = terms.get_last_focused()
		-- 	if term then
		-- 		term:send("visual_selection", { action = "visible" })
		-- 	end
		-- end, opts)

		-- Send current line as markdown code block
		-- map("n", "<leader>kS", function()
		-- 	local term = terms.get_last_focused()
		-- 	if term then
		-- 		term:send("single_line", { action = "visible", trim = false, decorator = "markdown_code" })
		-- 	end
		-- end, opts)

		-- Send visual selection as markdown code block
		-- map("x", "<leader>kS", function()
		-- 	local term = terms.get_last_focused()
		-- 	if term then
		-- 		term:send("visual_selection", { action = "visible", trim = false, decorator = "markdown_code" })
		-- 	end
		-- end, opts)
	end,
}
