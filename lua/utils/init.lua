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
	"norg",
	"norg_meta",
}

M.servers = {
	"ruby-lsp",
	"solargraph",
  "tsserver",
}

return M
