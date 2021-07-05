local finders = require('telescope.finders')
local make_entry = require('telescope.make_entry')
local previewers = require('telescope.previewers')
local utils = require('telescope.utils')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values
local defaulter = utils.make_default_callable
local putils = require('telescope.previewers.utils')

local git_file_diff = defaulter(function(opts)
  return previewers.new_buffer_previewer {
    title = "Git File Diff Preview",
    get_buffer_by_name = function(_, entry)
      return entry.value
    end,

    define_preview = function(self, entry, status)
      if entry.status and (entry.status == '??' or entry.status == 'A ') then
        local p = from_entry.path(entry, true)
        if p == nil or p == '' then return end
        conf.buffer_previewer_maker(p, self.state.bufnr, {
          bufname = self.state.bufname
        })
      else
        putils.job_maker({ 'git', '--no-pager', 'diff', 'master..HEAD', '--', entry.value }, self.state.bufnr, {
          value = entry.value,
          bufname = self.state.bufname,
          cwd = opts.cwd
        })
        putils.regex_highlighter(self.state.bufnr, 'diff')
      end
    end
  }
end, {})

function _G.git_diff(opts)
  if opts.cwd then
    opts.cwd = vim.fn.expand(opts.cwd)
  else
    opts.cwd = vim.loop.cwd()
  end

  local gen_new_finder = function()
    local git_cmd = {'git', 'merge-base', 'HEAD', 'master'}
    local output = utils.get_os_command_output(git_cmd, opts.cwd)

    if table.getn(output) == 0 then
      print('No changes found')
      return
    end

    local git_cmd = {'git', 'diff', '--name-only', output[1]}
    local output = utils.get_os_command_output(git_cmd, opts.cwd)

    if table.getn(output) == 0 then
      print('No changes found')
      return
    end

    return finders.new_table {
      results = output,
      entry_maker = make_entry.gen_from_file(opts)
    }
  end

  local initial_finder = gen_new_finder()
  if not initial_finder then return end

  pickers.new(opts, {
    prompt_title = 'Git diff',
    finder = initial_finder,
    previewer = git_file_diff.new(opts),
    sorter = conf.file_sorter(opts)
  }):find()
end
