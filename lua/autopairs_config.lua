local u = require('utils')
local npairs = require("nvim-autopairs")
local endwise = require('nvim-autopairs.ts-rule').endwise

u.g.endwise_no_mappings = 1
npairs.setup{}
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

require("nvim-autopairs.completion.compe").setup({
  map_cr = true,
  map_complete = true
})
