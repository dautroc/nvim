local M = {}

M.servers = {
  "lua_ls",
  -- "cssls",
  -- "html",
  -- "tsserver",
  -- "eslint",
  -- "bashls",
  "jsonls",
  "yamlls",
  "solargraph",
}

M.linters = {
  "prettier",
  "stylua",
  "rubocop",
}

M.parsers = {
  "lua",
  "vim",
  "markdown",
  "markdown_inline",
  "latex",
  "bash",
  "cpp",
  "c",
  "javascript",
  "typescript",
  "tsx",
  "html",
  "css",
  "json",
  "yaml",
  "toml",
  "regex",
  "dockerfile",
  "ruby",
}

return M
