local M = {}

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
	"embedded_template",
	"vimdoc",
}

M.servers = {
  "ruby-lsp",
  "solargraph",
}

return M
