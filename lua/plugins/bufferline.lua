return {
	"akinsho/bufferline.nvim",
  enabled = false,
	version = "*",
	lazy = false,
	dependencies = "tiagovla/scope.nvim",
	config = function()
		require("scope").setup()
		require("bufferline").setup({
			options = {
				themable = true,
			},
		})
	end,
	keys = {
		{
			"<A-r>",
			function()
				Snacks.input.input({
					prompt = "Enter tab name: ",
				}, function(name)
					if name == "" then
						print("Name cannot be empty")
						return
					end

					vim.cmd("BufferLineTabRename " .. name)
				end)
			end,
		},
	},
}
