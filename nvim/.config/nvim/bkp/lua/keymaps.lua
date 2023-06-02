-- Open netrw
vim.keymap.set("n", "<leader>f", vim.cmd.Ex)

-- System clipoard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- Delete to void
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_dP")
vim.keymap.set("v", "<leader>d", "\"_dP")

-- Change split focus
vim.keymap.set("n", "<M-l>", "<C-W>l")
vim.keymap.set("n", "<M-k>", "<C-W>k")
vim.keymap.set("n", "<M-j>", "<C-W>j")
vim.keymap.set("n", "<M-h>", "<C-W>h")

-- Replace all in file
-- On init.lua also have anoter replace
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>")

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- QuickFix list
vim.keymap.set("n",  "<C-j>", ":cnext<CR>")
vim.keymap.set("n",  "<C-k>", ":cprev<CR>")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Change to executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
