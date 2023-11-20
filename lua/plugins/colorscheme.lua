return {
  {
    'nyoom-engineering/oxocarbon.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'oxocarbon'
    end,
  },
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
    enabled = false,
  },
}
