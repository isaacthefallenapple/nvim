_G.fileexplorer = function(path)
  vim.cmd { cmd = 'Oil', args = { path } }
end

require 'core.keymaps'
require 'core.options'
require 'core.autocmds'
require 'core.usercmds'
require 'core.lazy'

-- See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
