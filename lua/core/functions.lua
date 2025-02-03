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

M.create_term = function(direction)
  vim.ui.input({
    prompt = "Enter name: ",
  }, function(name)

    if name == '' then
      print("Name cannot be empty")
      return
    end

    local term = require("toggleterm.terminal").Terminal:new({
      cmd = vim.o.shell,
      direction = direction,
      display_name = name,
    })

    term:open()
  end)
end

M.select_directory = function()
  local directories = {
    { cwd = "app/api", desc = "APIs" },
    { cwd = "app/models", desc = "Models" },
    { cwd = "db/migrate", desc = "Migrations" },
    { cwd = "app/views", desc = "Views" },
    { cwd = "app/mailers", desc = "Mailers" },
    { cwd = "app/services", desc = "Services" },
    { cwd = "app/policies", desc = "Policies" },
    { cwd = "config/locales", desc = "Locales" },
    { cwd = "app/controllers", desc = "Controllers" },
    { cwd = "spec/factories", desc = "Factories" },
    { cwd = "lib/tasks", desc = "Tasks" },
  }

  vim.ui.select(
    directories,
    {
      prompt = "Select directory to search:",
      format_item = function(item)
        return string.format("%s (%s)", item.desc, item.cwd)
      end,
    },
    function(choice)
      if choice then
        local search_options = {
          { value = "files", desc = "Search Files" },
          { value = "grep", desc = "Search Content (Grep)" },
        }

        vim.ui.select(
          search_options,
          {
            prompt = "Select search type:",
            format_item = function(item)
              return item.desc
            end,
          },
          function(search_choice)
            if search_choice then
              if search_choice.value == "files" then
                Snacks.picker.files({ cwd = choice.cwd })
              else
                Snacks.picker.grep({ cwd = choice.cwd })
              end
            end
          end
        )
      end
    end
  )
end

return M
