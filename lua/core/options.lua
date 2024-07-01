-- [[ Setting options ]]
-- See `:help vim.opt`

-- Set highlight on search
vim.opt.hlsearch = false
vim.opt.inccommand = 'nosplit'

-- Make line numbers default
vim.wo.relativenumber = true
vim.wo.number = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Use rg as grep provider
vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'

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

-- -- [[ Native indent-blankline ]]
-- vim.opt.list = true
--
-- ---@param tabstop number
-- ---@return string
-- local function get_leadmultispace(tabstop)
--   local lead = vim.fn.str2list '│'
--   for i = 2, tabstop do
--     lead[i] = 0x20
--   end
--   return vim.fn.list2str(lead)
-- end
--
-- vim.opt.listchars = {
--   nbsp = '␣',
--   trail = '␣',
--   extends = '>',
--   leadmultispace = get_leadmultispace(vim.opt.tabstop:get()),
-- }
--
-- local function update_lead()
--   local tabstop = vim.opt_local.tabstop:get()
--   vim.opt_local.listchars:append { leadmultispace = get_leadmultispace(tabstop) }
-- end
--
-- vim.api.nvim_create_autocmd('OptionSet', {
--   pattern = { 'listchars', 'tabstop', 'filetype' },
--   callback = function()
--     local opt_local = vim.opt_local
--     -- this doesn't strike me as particularly reliable, but it appears to work
--     vim.schedule(function()
--       opt_local.eventignore:append 'OptionSet'
--       update_lead()
--       opt_local.eventignore:remove 'OptionSet'
--     end)
--   end,
-- })
--
-- vim.o.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"

-- use treesitter folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldenable = false

vim.filetype.add { extension = {
  templ = 'templ',
  flix = 'flix',
} }
