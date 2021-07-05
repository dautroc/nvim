local u = require('utils')

u.g['$FZF_DEFAULT_COMMAND'] = 'rg --files --hidden'
u.g['$FZF_DEFAULT_OPTS'] = '--layout=reverse'

u.nmap('<leader>ag', '<ESC>:Rg<SPACE>')
u.nmap('<leader>fl', '<ESC>:BLines<CR>')
