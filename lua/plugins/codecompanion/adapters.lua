local M = {}

local copilot_adapter = function()
  return require("codecompanion.adapters").extend("copilot", {
    schema = {
      model = {
        default = "claude-sonnet-4",
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
  http = {
    copilot = copilot_adapter,
    ollama = ollama_adapter,
  },
}

return M
