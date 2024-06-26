return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'oxocarbon',
        component_separators = '|',
        section_separators = '',
      },
    },
    dependencies = { 'nyoom-engineering/oxocarbon.nvim' },
  },
}
