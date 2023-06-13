local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F1>", ":lua require'dap'.step_into()")
vim.keymap.set("n", "<F2>", ":lua require'dap'.step_over()")
vim.keymap.set("n", "<F3>", ":lua require'dap'.continue()")
