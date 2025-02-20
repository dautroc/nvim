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

M.create_term = function(direction, name)
	local function create_terminal(name)
		local Terminal = require("toggleterm.terminal").Terminal
		local terms = require("toggleterm.terminal").get_all()

		-- Check if terminal with given name already exists
		for _, term in pairs(terms) do
			if term.display_name == name then
				term:toggle()
				return
			end
		end

		-- Create new terminal if none exists with that name
		local term = Terminal:new({
			cmd = vim.o.shell,
			direction = direction,
			display_name = name,
		})

		term:open()
	end

	-- If no name provided, prompt user for input
	if not name or name == "" then
		Snacks.input.input({
			prompt = "Enter terminal name: ",
		}, function(input)
			if input and input ~= "" then
				create_terminal(input)
			else
				print("Name cannot be empty")
			end
		end)
	else
		create_terminal(name)
	end
end

return M
