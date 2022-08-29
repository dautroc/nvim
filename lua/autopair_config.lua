local npairs = require('nvim-autopairs')

npairs.setup{
  ignored_next_char = "[%w%.]" --Don't add pairs if the next char is alphanumeric
}

npairs.setup({ map_bs = false })
