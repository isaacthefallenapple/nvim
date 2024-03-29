return {
  {
    'stevearc/oil.nvim',
    opts = {
      columns = {},
      view_options = {
        show_hidden = true,
      },
    },
    config = function(_, opts)
      local oil = require 'oil'
      oil.setup(opts)

      vim.keymap.set('n', '-', '<Cmd>Oil<CR>', { desc = 'Open parent directory' })
    end,
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
