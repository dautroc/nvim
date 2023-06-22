return {
	"mfussenegger/nvim-dap",
  enabled = false,
	keys = {
		{ "<leader>dt", "<CMD>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle breakpoint" },
		{ "<leader>dc", "<CMD>lua require'dap'.continue()<CR>", desc = "Continue" },
		{ "<leader>do", "<CMD>lua require'dap'.step_over()<CR>", desc = "Step over" },
		{ "<leader>di", "<CMD>lua require'dap'.step_info()<CR>", desc = "Step info" },
		{ "<leader>dr", "<CMD>lua require'dap'.repl.open()<CR>", desc = "RELP open" },
	},
	config = function()
		local dap = require("dap")
		dap.adapters.ruby = function(callback, config)
			callback({
				type = "server",
				host = "127.0.0.1",
				port = "${port}",
				executable = {
					command = "bundle",
					args = {
						"exec",
						"rdbg",
						"-n",
						"--open",
						"--port",
						"${port}",
						"-c",
						"--",
						"bundle",
						"exec",
						config.command,
						config.script,
					},
				},
			})
		end

		dap.configurations.ruby = {
			{
				type = "ruby",
				name = "debug current file",
				request = "attach",
				localfs = true,
				command = "ruby",
				script = "${file}",
			},
			{
				type = "ruby",
				name = "run current spec file",
				request = "attach",
				localfs = true,
				command = "rspec",
				script = "${file}",
			},
		}
	end,
}
