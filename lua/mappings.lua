local u = require('utils')

-- Turn off highlight
u.map('n', '<C-c>', '<CMD>:noh<CR>', { nowait = true })

-- Switch window
u.map('', '<space>h', '<C-W>h',    { silent = true })
u.map('', '<space>j', '<C-W>j',    { silent = true })
u.map('', '<space>k', '<C-W>k',    { silent = true })
u.map('', '<space>l', '<C-W>l',    { silent = true })

-- Tab control
u.map('n', 'tn', ':tabnew<CR>',    { silent = true })
u.map('n', 'th', ':tabfirst<CR>',  { silent = true })
u.map('n', 'tl', ':tablast<CR>',   { silent = true })
u.map('n', 'tj', ':tabprev<CR>',   { silent = true })
u.map('n', 'tk', ':tabnext<CR>',   { silent = true })
u.map('n', 'tt', ':tabclose<CR>',  { silent = true })

u.map('n', '<F1>', '1gt',          { silent = true })
u.map('n', '<F2>', '2gt',          { silent = true })
u.map('n', '<F3>', '3gt',          { silent = true })
u.map('n', '<F4>', '4gt',          { silent = true })
u.map('n', '<F5>', '5gt',          { silent = true })
u.map('n', '<F6>', '6gt',          { silent = true })
u.map('n', '<F7>', '7gt',          { silent = true })
u.map('n', '<F8>', '8gt',          { silent = true })
u.map('n', '<F9>', ':tablast<CR>', { silent = true })

-- Quick escape
u.map('i', 'jj', '<ESC>')

-- Leader
u.g.mapleader = ','

-- Undo break points
u.imap('_', '_<C-g>u')
u.imap(',', ',<C-g>u')
u.imap('.', '.<C-g>u')
u.imap('!', '!<C-g>u')
u.imap('?', '?<C-g>u')
u.imap('[', '[<C-g>u')
u.imap(']', ']<C-g>u')
u.imap('{', '{<C-g>u')
u.imap('}', '}<C-g>u')
u.imap('(', '(<C-g>u')
u.imap(')', ')<C-g>u')

-- Copy till end
u.nmap('Y', 'y$')

-- Move text
u.vmap('<C-j>', ":m '>+1<CR>gv=gv")
u.vmap('<C-k>', ":m '<-2<CR>gv=gv")
u.imap('<C-j>', '<ESC>:m .+1<CR>==')
u.imap('<C-k>', '<ESC>:m .-2<CR>==')
u.nmap('<C-j>', ':m .+1<CR>==')
u.nmap('<C-k>', ':m .-2<CR>==')

-- Copy path
u.nmap('cp', ':let @+ = expand("%")<cr>')

-- Telescope

u.nmap('<C-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>")
u.nmap('<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>")
u.nmap('<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>")
u.nmap('<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>")
u.nmap('<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>")
u.nmap('<leader>fr', "<cmd>lua require('telescope.builtin').oldfiles()<cr>")

-- Buffers
u.nmap('<leader>bf', ':buffers<CR>:buffer<Space>')
