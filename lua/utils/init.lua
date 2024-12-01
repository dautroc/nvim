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
	"lua_ls",
	-- "solargraph",
  "ruby_lsp",
  "gopls",
  "pyright",
  "ts_ls"
}

return M
