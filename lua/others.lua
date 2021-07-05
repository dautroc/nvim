local u = require('utils')

-------------------- INDENT LINE -----------------------------------
u.g.indentLine_enabled = 0

-------------------- EASY MOTION -----------------------------------
u.g.EasyMotion_do_mapping = 0
u.g.EasyMotion_smartcase = 1
u.nmap('/', '<Plug>(easymotion-sn)')
u.nmap('/', '<Plug>(easymotion-tn)')
u.nmap('<tab>', '<Plug>(easymotion-bd-w)')

-------------------- GIT ------------------------------
u.map('n', '<leader>gt', ':call TimeLapse() <CR>', { silent = true })
u.map('n', '<leader>gb', ':Git blame<CR>', { silent = true })
