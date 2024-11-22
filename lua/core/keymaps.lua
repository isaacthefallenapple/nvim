-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Open file explorer
vim.keymap.set('n', '<leader>pv', '<Cmd>Pv<CR>', { desc = '[P]roject [V]iew' })
vim.keymap.set('n', '<leader>spv', '<Cmd>Spv<CR>', { desc = '[S]plit [P]roject [V]iew' })
vim.keymap.set('n', '<leader>vpv', '<Cmd>Vpv<CR>', { desc = '[V]split [P]roject [V]iew' })
vim.keymap.set('n', '<leader>tpv', '<Cmd>Tpv<CR>', { desc = '[T]ab [P]roject [V]iew' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Re-center after jump
vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})
vim.keymap.set('n', 'n', 'nzzzv', {})
vim.keymap.set('n', 'N', 'Nzzzv', {})

-- Uppercase word in insert mode
vim.keymap.set('i', '<M-u>', '<Esc>gUiw`]a')

-- Replace ex mode with gq
vim.keymap.set({ 'n', 'v', 'o' }, 'Q', 'gq')

-- Diagnostic keymaps
local function goto_next_diagnostic(severity)
  return function()
    vim.diagnostic.goto_next { severity = severity }
  end
end

local function goto_prev_diagnostic(severity)
  return function()
    vim.diagnostic.goto_prev { severity = severity }
  end
end

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '[w', goto_prev_diagnostic(vim.diagnostic.severity.WARN), { desc = 'Go to previous warning' })
vim.keymap.set('n', ']w', goto_next_diagnostic(vim.diagnostic.severity.WARN), { desc = 'Go to next warning' })
vim.keymap.set('n', '[e', goto_prev_diagnostic(vim.diagnostic.severity.ERROR), { desc = 'Go to previous error' })
vim.keymap.set('n', ']e', goto_next_diagnostic(vim.diagnostic.severity.ERROR), { desc = 'Go to next error' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader><tab>', '<Cmd>tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader><S-tab>', '<Cmd>tabp<CR>', { desc = 'Go to previous tab' })

-- All-cap word
vim.keymap.set('n', '<leader>u', 'gUiw', { desc = 'Make word all-caps' })
vim.keymap.set('n', '<leader>U', 'gUiW', { desc = 'Make WORD all-caps' })

-- Fugitive keymaps
vim.keymap.set('n', '<leader>gl', ':Git log --oneline<CR>', { desc = '[G]it [L]og' })
vim.keymap.set('n', '<leader>gs', '<Cmd>Git<CR>', { desc = '[G]it [S]tatus' })
