return {
	"nvim-neorg/neorg",
	keys = {
    -- Telescope module
		{ "<leader>nw", "<cmd>Telescope neorg switch_workspace<cr>", desc = "Switch workspace" },
		{ "<leader>nil", "<cmd>Telescope neorg insert_link<cr>", desc = "Insert link" },
		{ "<leader>nif", "<cmd>Telescope neorg insert_file_link<cr>", desc = "Insert file link" },

		{ "<leader>nt", "<cmd>Neorg toggle-concealer<cr>", desc = "Toggle concealer" },
		{ "<leader>nj", "<cmd>Neorg journal<cr>", desc = "Journal" },
		{ "<leader>nc", "<cmd>Neorg inject-metadata<cr>", desc = "Inject metadata" },
		{ "<leader>nn", "<cmd>Neorg index<cr>", desc = "Index" },
	},
	build = ":Neorg sync-parsers",
	dependencies = {
	  "nvim-lua/plenary.nvim",
	  "nvim-neorg/neorg-telescope"
	},
	config = function()
		local neorg_callbacks = require("neorg.callbacks")

		neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
			-- Map all the below keybinds only when the "norg" mode is active
			keybinds.map_event_to_mode("norg", {
				n = { -- Bind keys in normal mode
					{ "<C-s>", "core.integrations.telescope.find_linkable" },
				},

				i = { -- Bind in insert mode
					{ "<C-l>", "core.integrations.telescope.insert_link" },
				},
			}, {
				silent = true,
				noremap = true,
			})
		end)

		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.integrations.telescope"] = {},
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							home = "~/Dropbox/notes/home",
							employment_hero = "~/Dropbox/notes/employment_hero",
							joylists = "~/Dropbox/notes/joylists",
						},
						default_workspace = "home",
					},
				},
			},
		})
	end,
}
