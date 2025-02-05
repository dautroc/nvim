local M = {}

local copilot_adapter = function()
	return require("codecompanion.adapters").extend("copilot", {
		schema = {
			model = {
				default = "claude-3.5-sonnet",
			},
		},
	})
end

local ollama_adapter = function()
	return require("codecompanion.adapters").extend("ollama", {
		schema = {
			model = {
				default = "deepseek-r1:latest",
			},
		},
	})
end

M.supported_adapters = {
	copilot = copilot_adapter,
	ollama = ollama_adapter,
}

return M
