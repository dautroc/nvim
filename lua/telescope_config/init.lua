require('telescope_config/telescope_find_files')
require('telescope_config/telescope_diff_files')

local u = require('utils')

u.nmap('<C-h>', ':Telescope help_tags<cr>')
u.nmap('<C-p>', ':Telescope find_files<cr>')

u.nmap('<leader>fg', ':Telescope live_grep<cr>')
u.nmap('<leader>fr', ':Telescope oldfiles<cr>')
u.nmap('<leader>d', '<ESC>:call v:lua.git_diff({})<CR>', { silent = true })
