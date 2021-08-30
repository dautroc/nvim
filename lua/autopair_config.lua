local npairs = require('nvim-autopairs')

npairs.setup{
  ignored_next_char = "[%w%:%.]"
}

npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
