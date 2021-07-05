local u = require('utils')

-- Turn off highlight
u.map('n', '<C-c>', '<CMD>:noh<CR>', { nowait = true })

-- Switch window
u.map('', '<space>h', '<C-W>h', { silent = true })
u.map('', '<space>j', '<C-W>j', { silent = true })
u.map('', '<space>k', '<C-W>k', { silent = true })
u.map('', '<space>l', '<C-W>l', { silent = true })

-- Tab control
u.map('n', 'tn', ':tabnew<CR>',   { silent = true })
u.map('n', 'th', ':tabfirst<CR>', { silent = true })
u.map('n', 'tl', ':tablast<CR>',  { silent = true })
u.map('n', 'tj', ':tabprev<CR>',  { silent = true })
u.map('n', 'tk', ':tabnext<CR>',  { silent = true })
u.map('n', 'tt', ':tabclose<CR>', { silent = true })

-- Quick escape
u.map('i', 'jj', '<ESC>')

-- Get file path
u.map('', '<leader>pp', ':let @+=@%<CR>', { silent = true })

-- Leader
u.g.mapleader = ','

-- Ripgrep
u.nmap('<leader>ag', '<ESC>:Rg<CR>')
