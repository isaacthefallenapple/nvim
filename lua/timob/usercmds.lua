vim.api.nvim_create_user_command('Config', function()
  local path = vim.fn.stdpath 'config'
  vim.cmd { cmd = 'Ex', args = { path } }
end, {})

vim.api.nvim_create_user_command('Format', function()
  require('conform').format {
    bufnr = 0,
    timeout_ms = 500,
    lsp_fallback = true,
  }
end, { desc = 'Format with conform.nvim' })
