require'nvim-treesitter.configs'.setup {
  ensure_installed = { "ruby", "lua" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false
  },
  incremental_selection = {
    enable = false
  },
  autopairs = {
    enable = true
  },
	autotag = {
		enable = true
	}
}
