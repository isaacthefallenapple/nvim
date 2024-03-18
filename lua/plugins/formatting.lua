return {
  {
    'stevearc/conform.nvim',
    dependencies = { 'mason.nvim' },
    event = 'BufEnter',
    opts = {
      notify_on_error = false,
      formatters = {
        injected = { options = { ignore_errors = true } },
        ['purescript-tidy'] = {
          command = '/home/timob/.local/share/nvim/mason/bin/purs-tidy',
          args = { 'format' },
          stdin = true,
        },
        ['swift-format'] = {
          command = '/home/timob/.swift/swift-format/.build/release/swift-format',
          args = { 'format', '$FILENAME', '--in-place' },
          stdin = false,
        },
        fnlfmt = {
          command = '/home/timob/.fnlfmt/bin/fnlfmt',
          args = { '-' },
          stdin = true,
        },
      },
      formatters_by_ft = {
        html = { 'prettierd' },
        css = { 'prettierd' },
        json = { 'prettierd' },
        javascript = { 'prettierd' },
        purescript = { 'purescript-tidy' },
        swift = { 'swift-format' },
        lua = { 'stylua' },
        fennel = { 'fnlfmt' },
      },
    },
  },
}
