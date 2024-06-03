# Create mappings to modify target window via split ~

local map_split = function(buf_id, lhs, direction)
	local rhs = function()
		-- Make new window and set it as target
		local new_target_window
		vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
			vim.cmd(direction .. " split")
			new_target_window = vim.api.nvim_get_current_win()
		end)

		MiniFiles.set_target_window(new_target_window)
	end

	-- Adding `desc` will result into `show_help` entries
	local desc = "Split " .. direction
	vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
end

vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		local buf_id = args.data.buf_id
		map_split(buf_id, "<C-s>", "belowright horizontal")
		map_split(buf_id, "<C-v>", "belowright vertical")
	end,
})

return {
	"echasnovski/mini.nvim",
	keys = {
		{ "<leader>e", "<CMD>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", desc = "Mini file current" },
		{ "gS", "<CMD>lua MiniSplitjoin.toggle()<CR>", desc = "Mini split join" },
		{ "<leader>mt", "<CMD>lua MiniTrailspace.trim()<CR>", desc = "Mini Trim" },
	},
	event = "BufRead",
	version = false,
	config = function()
		require("mini.trailspace").setup()
    require("mini.diff").setup({
      -- Options for how hunks are visualized
      view = {
        -- Visualization style. Possible values are 'sign' and 'number'.
        -- Default: 'number' if line numbers are enabled, 'sign' otherwise.
        style = vim.go.number,

        -- Signs used for hunks with 'sign' view
        signs = { add = '▒', change = '▒', delete = '▒' },

        -- Priority of used visualization extmarks
        priority = 199,
      },

      -- Source for how reference text is computed/updated/etc
      -- Uses content from Git index by default
      source = nil,

      -- Delays (in ms) defining asynchronous processes
      delay = {
        -- How much to wait before update following every text change
        text_change = 200,
      },

      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Apply hunks inside a visual/operator region
        apply = '',

        -- Reset hunks inside a visual/operator region
        reset = '',

        -- Hunk range textobject to be used inside operator
        -- Works also in Visual mode if mapping differs from apply and reset
        textobject = '',

        -- Go to hunk range in corresponding direction
        goto_first = '[H',
        goto_prev = '[h',
        goto_next = ']h',
        goto_last = ']H',
      },

      -- Various options
      options = {
        -- Diff algorithm. See `:h vim.diff()`.
        algorithm = 'histogram',

        -- Whether to use "indent heuristic". See `:h vim.diff()`.
        indent_heuristic = true,

        -- The amount of second-stage diff to align lines (in Neovim>=0.9)
        linematch = 60,

        -- Whether to wrap around edges during hunk navigation
        wrap_goto = false,
      },
    })
		require("mini.statusline").setup()
    require("mini.splitjoin").setup()
    require("mini.notify").setup()
    require('mini.indentscope').setup()
		require("mini.files").setup({
			mappings = {
				close = "q",
				go_in = "l",
				go_in_plus = "<CR>",
				go_out = "h",
				go_out_plus = "H",
				reset = "<BS>",
        reveal_cwd  = '@',
				show_help = "g?",
				synchronize = "w",
				trim_left = "<",
				trim_right = ">",
			},
			windows = {
				-- Maximum number of windows to show side by side
				max_number = math.huge,
				-- Whether to show preview of file/directory under cursor
				preview = true,
				-- Width of focused window
				width_focus = 50,
				-- Width of non-focused window
				width_nofocus = 15,
				-- Width of preview window
				width_preview = 100,
			},
		})
	end,
}
