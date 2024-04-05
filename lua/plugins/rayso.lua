return {
  'TobinPalmer/rayso.nvim',
  enabled = false,
  cmd = { 'Rayso' },
  config = function()
    require('rayso').setup {}
  end
}
