return {
  {
    'stevearc/conform.nvim',
    dependencies = { 'mason.nvim' },
    event = 'BufEnter',
    opts = {
      formatters = {
        injected = { options = { ignore_errors = true } },
        ['purescript-tidy'] = {
          command = '/home/timob/.local/share/nvim/mason/bin/purs-tidy',
          args = { 'format' },
          stdin = true,
        },
        ['swift-format'] = {
          command = '/home/timob/.swift/swift-format/.build/release/swift-format',
        },
      },
      formatters_by_ft = {
        html = { 'prettierd' },
        json = { 'prettierd' },
        purescript = { 'purescript-tidy' },
        swift = { 'swift-format' },
        lua = { 'stylua' },
      },
    },
  },
}
