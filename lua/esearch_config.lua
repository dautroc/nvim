local u = require('utils')

u.nmap('<leader>es', '<Plug>(esearch)')

local esearch = {}
esearch = {}
esearch.default_mappings = 0
esearch.name = '[esearch]'
esearch.regex   = 1
esearch.textobj = 0
esearch.case    = 'smart'
esearch.win_map = {
{ 'n', 'x',   '<plug>(esearch-win-split:reuse:stay):q!<cr>' },
{ 'n', 'v',   '<plug>(esearch-win-vsplit:reuse:stay):q!<cr>' },
{ 'n', '{',   '<plug>(esearch-win-jump:filename:up)' },
{ 'n', '}',   '<plug>(esearch-win-jump:filename:down)' },
{ 'n', 'j',   '<plug>(esearch-win-jump:entry:down)' },
{ 'n', 'k',   '<plug>(esearch-win-jump:entry:up)' },
{ 'n', 'r',   '<plug>(esearch-win-reload)' },
{ 'n', '<cr>', '<plug>(esearch-win-open)' },
{ 'n', '<esc>', ':q!<cr>' }
}

u.g.esearch = esearch

u.cmd[[highlight link esearchLineNr Comment]]
u.cmd[[highlight link esearchCursorLineNr esearchFilename]]

