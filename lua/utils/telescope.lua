local M = {}

function M.grep_at_current_tree_node()
    local node = require('nvim-tree.lib').get_node_at_cursor()
    if not node then return end
    require('telescope.builtin').live_grep({search_dirs = {node.absolute_path}})
end

return M

-- Another approach
-- live grep using Telescope inside the current directory under
-- the cursor (or the parent directory of the current file)
-- local function grep_in(node)
--   if not node then
--     return
--   end
--   local path = node.absolute_path or uv.cwd()
--   if node.type ~= 'directory' and node.parent then
--     path = node.parent.absolute_path
--   end
--   require('telescope.builtin').live_grep({
--     search_dirs = { path },
--     prompt_title = string.format('Grep in [%s]', vim.fs.basename(path)),
--   })
-- end

-- in the nvimtree `setup`
-- { key = '<C-f>', action = '', action_cb = grep_at, mode = 'n' },
