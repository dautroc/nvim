local u = require('utils')

u.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
u.cmd 'au FileType jsonnet set tabstop=2 shiftwidth=2 softtabstop=2'
u.cmd 'au FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2'
u.cmd 'au FileType lua set tabstop=2 shiftwidth=2 softtabstop=2'
u.cmd 'au BufEnter * autocmd! matchparen'