return {
	"waiting-for-dev/ergoterm.nvim",
	config = function()
		require("ergoterm").setup({
      picker = {
        picker = "telescope",
      },
    })
	end,
}
