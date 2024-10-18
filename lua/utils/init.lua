local M = {}

M.parsers = {
  "python",
  "go",
	"lua",
	"vim",
	"markdown",
	"markdown_inline",
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
	"vimdoc",
	"norg",
	"norg_meta",
}

M.servers = {
	"ruby-lsp",
	-- "solargraph",
  "tsserver",
  "golangci-lint-langserver",
  "gopls",
  "pyright",
}

return M
