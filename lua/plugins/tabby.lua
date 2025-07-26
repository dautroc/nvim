return {
	"nanozuki/tabby.nvim",
	event = "VeryLazy",
	config = function()
		local theme = {
			fill = "TabLineFill",
			head = "TabLine",
			current_tab = "TabLineSel",
			tab = "TabLine",
			win = "TabLine",
			tail = "TabLine",
		}

		require("tabby").setup({
			preset = "active_tab_with_wins",

			line = function(line)
				return {
					{
						{ "  ", hl = theme.head },
						line.sep("", theme.head, theme.fill),
					},
					line.tabs().foreach(function(tab)
						local hl = tab.is_current() and theme.current_tab or theme.tab
						return {
							line.sep("", hl, theme.fill),
							tab.is_current() and "" or "󰆣",
							tab.number(),
							tab.name(),
							tab.close_btn(""),
							line.sep("", hl, theme.fill),
							hl = hl,
							margin = " ",
						}
					end),
					line.spacer(),
					line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
						return {
							line.sep("", theme.win, theme.fill),
							win.is_current() and "" or "",
							win.buf_name(),
							line.sep("", theme.win, theme.fill),
							hl = theme.win,
							margin = " ",
						}
					end),
					{
						line.sep("", theme.tail, theme.fill),
						{ "  ", hl = theme.tail },
					},
					hl = theme.fill,
				}
			end,
		})
	end,
	keys = {
		{
			"<A-r>",
			function()
				local cwd = vim.fn.getcwd()
				local project_name = vim.fn.fnamemodify(cwd, ":t")

				if project_name and project_name ~= "" then
					vim.t.tab_name = project_name
          vim.cmd("Tabby rename_tab " .. project_name)
				end
			end,
		},
	},
}
