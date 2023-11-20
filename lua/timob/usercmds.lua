vim.api.nvim_create_user_command('Config', function()
  local path = vim.fn.stdpath 'config'
  vim.cmd { cmd = 'Ex', args = { path } }
end, {})
