local npairs = require('nvim-autopairs')

npairs.setup{
  ignored_next_char = "[%w%.]" --Don't add pairs if the next char is alphanumeric
}

local remap = vim.api.nvim_set_keymap

npairs.setup({ map_bs = false })

vim.g.coq_settings = {
  keymap = {
		recommended = false,
		jump_to_mark = ""
	},
	["keymap.repeat"] = "z", -- repeat is keyword in lua, make completion for coq
  auto_start = true,
  clients = {
    buffers = {
      same_filetype = true
    }
  }
}

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<c-j>', [[pumvisible() ? "<npairs>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<c-k>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      -- you can change <c-g><c-g> to <c-e> if you don't use other i_CTRL-X modes
      return npairs.esc('<c-g><c-g>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })

-- Endwise
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
