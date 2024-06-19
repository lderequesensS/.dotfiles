-- Set highlight on search
vim.o.hlsearch = false

-- Thick cursor
vim.o.guicursor = ""

-- Make line numbers default
vim.wo.number = true

-- Relative numbers
vim.o.relativenumber = true

-- Scroll limit
vim.o.scrolloff = 8

-- If nothing happens in 50ms then write the swap file inot disk
vim.o.updatetime = 50

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Color line to brake lines
vim.o.colorcolumn = "80"

-- Don't wrap lines
vim.o.wrap = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Apparently I love tabs...
-- vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
-- vim.o.noexpandtab = true -- Removed version v0.10.0
vim.o.list = true -- show tabs and other values of listchars list
-- vim.o.softtabstop = 4

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- For undotree
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
