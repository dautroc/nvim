-- Call :AC to create alternative file
vim.cmd([[
	command AC :execute "e " . eval('rails#buffer().alternate()')
]])
