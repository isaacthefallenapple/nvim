-- [[ Setting options ]]
-- See `:help vim.opt`

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.inccommand = 'nosplit'

-- Make line numbers default
vim.wo.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- Native indent-blankline
vim.opt.list = true
vim.opt.listchars = {
  leadmultispace = '│ ',
}

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8

vim.opt.signcolumn = 'yes'

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.virtualedit = 'block'

vim.opt.wildmode = 'longest:full,full'

vim.o.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
