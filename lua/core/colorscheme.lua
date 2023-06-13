vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_better_performance = 1

-- Set the background color based on the time of day
local adapt_background = function()
	if tonumber(os.date("%H")) < 12 then
		return "light"
	else
		return "dark"
	end
end

-- Automatically update the background color when entering and leaving Vim
vim.cmd([[
  autocmd VimEnter * lua vim.opt.background = ]] .. adapt_background() .. [[
]])
