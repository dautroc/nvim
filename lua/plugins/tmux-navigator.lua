return {
	"alexghergh/nvim-tmux-navigation",
  enabled = false,
  keys = {
    {"<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>"},
    {"<C-j>", "<cmd>NvimTmuxNavigateDown<CR>"},
    {"<C-k>", "<cmd>NvimTmuxNavigateUp<CR>"},
    {"<C-l>", "<cmd>NvimTmuxNavigateRight<CR>"},
  },
	config = function()
		local nvim_tmux_nav = require("nvim-tmux-navigation")

    nvim_tmux_nav.setup({
      disable_when_zoomed = true,
    })
	end,
}
