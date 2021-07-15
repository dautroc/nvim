local u = require('utils')

-------------------- INDENT LINE -----------------------------------
u.g.indentLine_enabled = 0

-------------------- GIT ------------------------------
u.map('n', '<leader>gt', ':call TimeLapse() <CR>', { silent = true })
u.map('n', '<leader>gb', ':Git blame<CR>', { silent = true })
