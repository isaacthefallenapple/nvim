return {
  {
    'isaacthefallenapple/oxocarbon.nvim',
    branch = 'lualine',
    config = function()
      vim.opt.background = 'dark'
      vim.cmd.colorscheme = 'oxocarbon'
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
