local M = {}

M.say_word = function()
	local word = vim.fn.expand("<cword>")
	vim.fn.system("say " .. word)
end

M.smart_delete = function()
	if vim.bo.buftype == "quickfix" then
		local cursor_pos = vim.api.nvim_win_get_cursor(0)
		local line_number = cursor_pos[1]
		local current_list = vim.fn.getqflist()
		table.remove(current_list, line_number)
		vim.fn.setqflist({}, "r", { items = current_list })
	else
		vim.api.nvim_feedkeys("dd", "n", true)
	end
end

M.toggle_theme = function()
  current_mode = vim.o.background

  if current_mode == "light" then
    vim.api.nvim_set_option("background", "dark")
  else
    vim.api.nvim_set_option("background", "light")
  end

  vim.cmd("colorscheme gruvbox-material")
end


return M
