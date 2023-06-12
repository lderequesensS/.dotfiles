-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Scroll limit
vim.o.scrolloff = 8

-- If nothing happens in 50ms then write the swap file inot disk
vim.o.updatetime = 50

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Don't wrpa lines
vim.o.wrap = false

-- Color line to brake lines
vim.o.colorcolumn = "80"

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Relative numbers
vim.o.relativenumber = true

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Tabs plz
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Thick cursor
vim.o.guicursor = ""

-- For undotree
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true
