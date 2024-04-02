return {
  'raddari/last-color.nvim',
  config = function()
    require('last-color').setup()
    local theme = require('last-color').recall() or 'kanagawa'
    vim.cmd(('colorscheme %s'):format(theme))
  end
}
