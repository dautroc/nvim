local M = {}

M.parsers = {
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
}

M.servers = {
  "ruby-lsp",
  "solargraph",
}

return M
