local npairs = require("nvim-autopairs")
local endwise = require('nvim-autopairs.ts-rule').endwise

npairs.setup()

-- Doesn't work???
npairs.add_rules({
  endwise('def$', 'end', 'rb', 'method'),
  endwise('then$', 'end', 'lua', 'if_statement')
})
