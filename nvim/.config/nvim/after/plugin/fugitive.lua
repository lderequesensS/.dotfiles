vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- For conflict merge on dv view
vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
