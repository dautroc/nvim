require'nvim-treesitter.configs'.setup {
  ensure_installed = { "ruby", "lua" },
  sync_install = false,
  highlight = {
    enable = true,
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
	},
	endwise = {
		enable = true,
	}
}
