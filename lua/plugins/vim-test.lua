local function run_test_persistent(cmd)
  -- Create a temporary script to avoid quoting issues
  local script_content = string.format([[
    %s
    echo "Test completed. Press Enter to continue..."
    read
    exec $SHELL
    ]], cmd)

  local temp_file = vim.fn.tempname() .. '.sh'
  vim.fn.writefile(vim.split(script_content, '\n'), temp_file)
  vim.fn.system('chmod +x ' .. temp_file)

  vim.cmd('FloatermNew --wintype=split --autoclose=0 --title=Test bash ' .. temp_file)
end

return {
	"vim-test/vim-test",
	event = "VeryLazy",
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>tn", ":TestNearest<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>tf", ":TestFile<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>tl", ":TestLast<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>tv", ":TestVisit<CR>", { noremap = true, silent = true })

		-- vim.g["test#strategy"] = "floaterm"
		-- Use the custom strategy
		vim.g["test#custom_strategies"] = {
			persistent_floaterm = run_test_persistent,
		}
		vim.g["test#strategy"] = "persistent_floaterm"
	end,
}
