return {
	'mfussenegger/nvim-dap',
	config = function ()
		local dap = require("dap")
		local dapui = require("dapui")
		vim.keymap.set("n", "<F1>", dap.continue, {})
		vim.keymap.set("n", "<F2>", dap.step_over, {})
		vim.keymap.set("n", "<F3>", dap.step_into, {})
		vim.keymap.set("n", "<F4>", dap.step_out, {})
		vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})

		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		-- Let's check objects on virtual text
		require("nvim-dap-virtual-text").setup {}
		vim.keymap.set("n", "<leader>?", function ()
			require("dapui").eval(nil, { enter = true })
		end)

		require("dap-python").setup("python")
	end,
	dependencies = {
		'mfussenegger/nvim-dap-python',
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	}
}
