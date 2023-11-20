return {
  {
    'stevearc/conform.nvim',
    dependencies = { 'mason.nvim' },
    lazy = true,
    cmd = 'ConformInfo',
    keys = {
      {
        '<leader>cF',
        function()
          require('conform').format { bufnr = 0 }
        end,
        mode = { 'n', 'v' },
        desc = 'Format Injected Langs',
      },
    },
    opts = {
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
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
