local M = {}

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
