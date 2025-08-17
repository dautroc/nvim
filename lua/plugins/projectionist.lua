local rails_projections = {
	["app/controllers/*.rb"] = {
		alternate = "spec/controllers/{}_spec.rb",
		type = "controller",
	},
	["app/models/*.rb"] = {
		alternate = "spec/models/{}_spec.rb",
		type = "model",
	},
	["app/views/*/*.html.erb"] = {
		type = "view",
	},
	["spec/controllers/*_spec.rb"] = {
		alternate = "app/controllers/{}.rb",
		type = "test",
	},
	["spec/models/*_spec.rb"] = {
		alternate = "app/models/{}.rb",
		type = "test",
	},
	["config/routes.rb"] = {
		type = "config",
	},
	["db/migrate/*.rb"] = {
		type = "migration",
	},
}

local gem_projections = {
	["lib/*.rb"] = {
		alternate = "spec/{}_spec.rb",
		type = "lib",
	},
	["spec/*_spec.rb"] = {
		alternate = "lib/{}.rb",
		type = "test",
	},
	["bin/*"] = {
		type = "bin",
	},
	["Rakefile"] = {
		type = "rakefile",
	},
}

return {
	"tpope/vim-projectionist",
	lazy = false,
	config = function()
		require("plugins.projectionist")

		vim.g.projectionist_heuristics = {
			["app/controllers/|app/models/"] = rails_projections,
			["lib/|bin/"] = gem_projections,
		}
	end,
}
