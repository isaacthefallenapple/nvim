-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Open Netrw
vim.keymap.set('n', '<leader>pv', ':Ex<CR>', { desc = '[P]roject [V]iew' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Re-center after jump
vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})
vim.keymap.set('n', 'n', 'nzzzv', {})
vim.keymap.set('n', 'N', 'Nzzzv', {})

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

vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']e', goto_next_diagnostic { min = vim.diagnostic.severity.WARN }, { desc = 'Go to next error message' })
vim.keymap.set('n', '[e', goto_prev_diagnostic { min = vim.diagnostic.severity.WARN }, { desc = 'Go to previous error message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

vim.keymap.set('n', '<leader><tab>', ':tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader><S-tab>', ':tabp<CR>', { desc = 'Go to previous tab' })

-- Fugitive keymaps
vim.keymap.set('n', '<leader>gl', ':Git log --oneline<CR>', { desc = '[G]it [L]og' })
vim.keymap.set('n', '<leader>gs', ':Git<CR>', { desc = '[G]it [S]tatus' })
