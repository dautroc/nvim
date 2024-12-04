return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = false },
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
	},
	keys = {
    -- Scratch
		{ "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer", },
		{ "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },

    -- Notifications
		{ "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Notification History", },
		{ "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications", },

    -- Git
		{ "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v"} },
		{ "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History", },
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit", },
		{ "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)", },

    -- Neovim news
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.6,
          height = 0.6,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
	}
}
