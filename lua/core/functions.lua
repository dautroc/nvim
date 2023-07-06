local M = {}

M.say_word = function()
  local word = vim.fn.expand("<cword>")
  vim.fn.system("say " .. word)
end

return M
