return {
  'raddari/last-color.nvim',
  enabled = false,
  config = function()
    require('last-color').setup()
    local theme = require('last-color').recall()
    vim.cmd(('colorscheme %s'):format(theme))
  end
}
