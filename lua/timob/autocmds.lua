-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Remove garbage default comment format options ]]
-- See `:help formatoptions`
local format_group = vim.api.nvim_create_augroup('FormatOptions', {})
vim.api.nvim_create_autocmd('BufEnter', {
  group = format_group,
  callback = function()
    vim.opt.formatoptions:remove { 'o' }
  end,
})

-- [[ Set filetypes ]]
local filetype_group = vim.api.nvim_create_augroup('Filetype', {})
-- ft=vlang
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = filetype_group,
  pattern = '*.v',
  callback = function(_)
    vim.bo.filetype = 'vlang'
  end,
})

-- ft=purescript
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = filetype_group,
  pattern = '*.purs',
  callback = function(_)
    vim.bo.filetype = 'purescript'
  end,
})

local startup_group = vim.api.nvim_create_augroup('Startup', { clear = true })
-- :cd into <dir> when opening it with nvim <dir>
vim.api.nvim_create_autocmd('VimEnter', {
  group = startup_group,
  callback = function(_)
    vim.cmd { cmd = 'cd', args = { '%:p:h' } }
  end,
})

local close_with_q_group = vim.api.nvim_create_augroup('Close with Q', { clear = true })
-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  group = close_with_q_group,
  pattern = {
    'help',
    'lspinfo',
    'man',
    'notify',
    'checkhealth',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})