local utils = {}

utils.cmd = vim.cmd
utils.fn = vim.fn
utils.g = vim.g
utils.opt = vim.opt

function utils.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return utils
