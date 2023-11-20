-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
return {
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require 'cmp'
      opts.snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      }
      opts.mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm { select = false }
          else
            cmp.abort()
            fallback()
          end
        end,
        ['<Tab>'] = cmp.mapping.confirm { select = true },
        ['<C-y>'] = cmp.mapping.confirm { select = true },
      }
      opts.preselect = cmp.PreselectMode.None
      ---@ignore
      opts.completion = {
        completeopt = 'menu,menuone,noinsert,noselect',
      }
      opts.sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }
    end,
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        config = function(_, opts)
          require('luasnip.loaders.from_vscode').lazy_load()
          require('luasnip').config.setup(opts)
        end,
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },
}
