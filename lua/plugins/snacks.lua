return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    indent = { enabled = true },
    scroll = { enabled = true },
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          {
            icon = " ",
            key = "g",
            desc = "Find Text",
            action = ":lua Snacks.dashboard.pick('live_grep')",
          },
          {
            icon = " ",
            key = "r",
            desc = "Recent Files",
            action = ":lua Snacks.dashboard.pick('oldfiles')",
          },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          {
            icon = "󰒲 ",
            key = "L",
            desc = "Lazy",
            action = ":Lazy",
            enabled = package.loaded.lazy ~= nil,
          },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
    zen = {
      win = {
        width = 0.8,
      }
    },
    picker = {
      -- transform = function(item)
      -- 	if not item.file then
      -- 		return item
      -- 	end
      -- 	-- Demote the "lazyvim" keymaps file:
      -- 	if item.file:match("lazyvim/lua/config/keymaps%.lua") then
      -- 		item.score_add = (item.score_add or 0) - 30
      -- 	end
      -- 	-- Boost the "neobean" keymaps file:
      -- 	-- if item.file:match("neobean/lua/config/keymaps%.lua") then
      -- 	--   item.score_add = (item.score_add or 0) + 100
      -- 	-- end
      -- 	return item
      -- end,
      -- In case you want to make sure that the score manipulation above works
      -- or if you want to check the score of each file
      debug = {
        scores = false, -- show scores in the list
      },
      -- I like the "ivy" layout, so I set it as the default globaly, you can
      -- still override it in different keymaps
      layout = {
        preset = "ivy",
        -- When reaching the bottom of the results in the picker, I don't want
        -- it to cycle and go back to the top
        cycle = false,
      },
      layouts = {
        ivy = {
          layout = {
            box = "vertical",
            backdrop = false,
            row = -1,
            width = 0,
            height = 0.5,
            border = "top",
            title = " {title} {live} {flags}",
            title_pos = "left",
            { win = "input", height = 1, border = "bottom" },
            {
              box = "horizontal",
              { win = "list", border = "none" },
              { win = "preview", title = "{preview}", width = 0.5, border = "left" },
            },
          },
        },
        -- I wanted to modify the layout width
        vertical = {
          layout = {
            backdrop = false,
            width = 0.8,
            min_width = 80,
            height = 0.8,
            min_height = 30,
            box = "vertical",
            border = "rounded",
            title = "{title} {live} {flags}",
            title_pos = "center",
            { win = "input", height = 1, border = "bottom" },
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", height = 0.4, border = "top" },
          },
        },
      },
      matcher = {
        frecency = true,
      },
      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
            ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
            ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
            ["<C-f>"] = { "toggle_live", mode = { "i", "n" } },
          },
        },
      },
    },
  },
  keys = {
    -- Git
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "Open in browser", mode = { "n", "v" }, },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "File history", },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit", },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Log", },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Status" },

    -- Searching
    { "<leader><leader>", function() Snacks.picker.files() end, desc = "Files" },
    { "<leader>fr", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fS", function() Snacks.picker.grep_buffers() end, desc = "Grep open buffers" },
    { "<leader>fs", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Word", mode = { "n", "x" } },
    { "<leader>fl", function() Snacks.picker.lazy() end, desc = "Lazynvim plugins" },
    { "<leader>fz", function() Snacks.picker.lines() end, desc = "Lines" },
    { "<leader>fC", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config files" },
    { "<leader>fo", function() Snacks.picker.recent() end, desc = "Recent" },
    { "<leader>fy", function() Snacks.picker.registers() end, desc = "Registers" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command history" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Quickfix list" },
    { "<leader>fc", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fn", function() Snacks.picker.notifications() end, desc = "Notifications" },
    { "<leader>fa", function() Snacks.picker.pickers() end, desc = "Actions" },
    { "<leader>fm", function() Snacks.picker.smart() end, desc = "Smart" },
    { "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo" },

    -- Rails
    {"<leader>fd", ":lua require('core.functions').select_directory()<CR>", desc = "Directory"},

    -- Lsp
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto definition" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto type definition" },
    { "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },

    -- Explorer
    { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
    { "<leader>z", function() Snacks.zen() end, desc = "Zen zoom" },
  },
}
