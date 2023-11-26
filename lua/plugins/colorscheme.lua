return {
  {
    'isaacthefallenapple/oxocarbon.nvim',
    build = 'make',
    config = function()
      vim.opt.background = 'dark'
      vim.cmd.colorscheme = 'oxocarbon'
    end,
    dependencies = { 'rktjmp/hotpot.nvim' },
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
