local M = {}
local supported_adapters = require("plugins.codecompanion.adapters").supported_adapters

local save_path = function()
	local Path = require("plenary.path")
	local p = Path:new(vim.fn.stdpath("data") .. "/codecompanion_chats")
	p:mkdir({ parents = true })
	return p
end

function M:init()
	--- Load a saved codecompanion.nvim chat file into a new CodeCompanion chat buffer.
	--- Usage: CodeCompanionLoad
	vim.api.nvim_create_user_command("CodeCompanionLoad", function()
		local snacks = require("snacks.picker")
		local codecompanion = require("codecompanion")

		local function select_adapter(filepath)
			-- Create a sorted list with copilot first
			local adapters = vim.tbl_keys(supported_adapters)
			table.sort(adapters, function(a, b)
				if a == "copilot" then
					return true
				elseif b == "copilot" then
					return false
				else
					return a < b
				end
			end)

			snacks.select(adapters, {
				prompt = "Select Adapter",
			}, function(adapter)
				if adapter then
					-- Ensure we're using vim.schedule to handle the command after the picker closes
					vim.schedule(function()
						-- Try to use the API first
						if codecompanion.create_chat then
							codecompanion.create_chat(adapter)
						else
							-- Fallback to command
							local cmd = string.format("CodeCompanionChat %s", adapter)
							vim.cmd(cmd)
						end

						-- Read contents of saved chat file after a short delay
						vim.defer_fn(function()
							local lines = vim.fn.readfile(filepath)
							local current_buf = vim.api.nvim_get_current_buf()
							vim.api.nvim_buf_set_lines(current_buf, 0, -1, false, lines)
						end, 100)
					end)
				end
			end)
		end

		local function start_picker()
			local files = vim.fn.glob(save_path() .. "/*", false, true)

			snacks.select(files, {
				prompt = "Saved Chats",
				format_item = function(item)
					return vim.fn.fnamemodify(item, ":t")
				end,
			}, function(selected)
				if selected then
					select_adapter(selected)
				end
			end)
		end

		start_picker()
	end, {})

	-- Rest of the code remains the same
	vim.api.nvim_create_user_command("CodeCompanionSave", function(opts)
		local codecompanion = require("codecompanion")
		local success, chat = pcall(function()
			return codecompanion.buf_get_chat(0)
		end)
		if not success or chat == nil then
			vim.notify("CodeCompanionSave should only be called from CodeCompanion chat buffers", vim.log.levels.ERROR)
			return
		end
		if #opts.fargs == 0 then
			vim.notify("CodeCompanionSave requires at least 1 arg to make a file name", vim.log.levels.ERROR)
		end
		local save_name = table.concat(opts.fargs, "-") .. ".md"
		local save_file = save_path():joinpath(save_name)
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
		save_file:write(table.concat(lines, "\n"), "w")
	end, { nargs = "*" })
end

return M
