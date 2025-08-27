local keymaps = require("lsp.keymaps")
local capabilities = keymaps.capabilities

local server_configs = {
  lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
  },
  ruby_lsp = {
    cmd = { "ruby-lsp" },
    filetypes = { "ruby" },
  },
  ts_ls = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  },
  pyright = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
  },
  gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
  },
  copilot = {
    settings = {
      telemetry = {
        telemetryLelvel = "off",
      },
    },
  }
}

for server_name, config in pairs(server_configs) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = config.filetypes,
    callback = function()
      vim.lsp.start({
        name = server_name,
        cmd = config.cmd,
        capabilities = capabilities,
      })
    end,
  })
end
