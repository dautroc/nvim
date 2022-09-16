local u = require('utils')

u.map('n', '<leader>tn', ':TestNearest<CR>')
u.map('n', '<leader>tf', ':TestFile<CR>')
u.map('n', '<leader>ts', ':TestSuite<CR>')

u.g.VimuxUseNearest = 0
u.g['test#strategy'] = 'tmuxify'
u.g['test#ruby#rspec#executable'] = 'bundle exec rspec'
