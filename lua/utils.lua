local U = {}

U.cmd = vim.cmd
U.fn = vim.fn
U.g = vim.g
U.opt = vim.opt

function U.map(mode, key, action, opts)
  opts = vim.tbl_extend('keep', opts or {},
                        {noremap = true, silent = true, expr = false})
  vim.api.nvim_set_keymap(mode, key, action, opts)
end

function U.plugmap(mode, key, action, opts)
  opts = vim.tbl_extend('keep', opts or {},
                        {noremap = not vim.startswith(action, "<Plug>")})
  U.map(mode, key, action, opts)
end

function U.nmap(key, action, opts)
  U.plugmap("n", key, action, opts)
end

function U.vmap(key, action, opts)
  U.plugmap("v", key, action, opts)
end

function U.imap(key, action, opts)
  U.plugmap("i", key, action, opts)
end

function U.xmap(key, action, opts)
  U.plugmap("x", key, action, opts)
end

function U.YankOneLine()
  U.fn.setreg("+", U.fn.trim(U.fn.getline('.')))
  print("[YankOneLine] one line yanked to system clipboard")
end

function U.ToggleMouse()
  if vim.o.mouse == "" then
    vim.o.mouse = "a"
    print("[ToggleMouse] mouse enabled")
  else
    vim.o.mouse = ""
    print("[ToggleMouse] mouse disabled")
  end
end

function U.GetLineEnd()
  local label = {unix = "LF", mac = "CR", dos = "CRLF"}
  return label[vim.bo.fileformat]
end

return U
