vim.api.nvim_create_user_command('Config', function()
  local path = vim.fn.stdpath 'config'
  vim.cmd.cd(path)
  vim.cmd { cmd = 'Oil', args = { path } }
end, {})

vim.api.nvim_create_user_command('Format', function()
  require('conform').format {
    bufnr = 0,
    timeout_ms = 500,
    lsp_fallback = true,
  }
end, { desc = 'Format with conform.nvim' })

local function withBang(cmd, bang)
  if bang then
    return cmd .. '!'
  else
    return cmd
  end
end

-- :Pv[!] Open [P]roject [V]iew
vim.api.nvim_create_user_command('Pv', function(args)
  local path = args.bang and vim.fn.getcwd() or vim.fn.expand '%:p:h'
  vim.cmd { cmd = 'Oil', args = { path } }
end, { bang = true })
-- :Spv[!] Open [S]plit [P]roject [V]iew
vim.api.nvim_create_user_command('Spv', function(args)
  vim.cmd('sp | ' .. withBang('Pv', args.bang))
end, { bang = true })
-- :Vpv[!] Open [V]split [P]roject [V]iew
vim.api.nvim_create_user_command('Vpv', function(args)
  vim.cmd('vsp | ' .. withBang('Pv', args.bang))
end, { bang = true })
-- :Tpv[!] Open [T]ab [P]roject [V]iew
vim.api.nvim_create_user_command('Tpv', function(args)
  vim.cmd('tab split | ' .. withBang('Pv', args.bang))
end, { bang = true })

vim.api.nvim_create_user_command('ToggleAutoFormat', function()
  local disable = not vim.g.disable_autoformat
  vim.g.disable_autoformat = disable
  local message
  if disable then
    message = 'disabled'
  else
    message = 'enabled'
  end
  vim.notify(string.format('auto format %s', message), vim.log.levels.INFO)
end, {})
