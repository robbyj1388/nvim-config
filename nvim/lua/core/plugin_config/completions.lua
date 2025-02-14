
local cmp = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- Use Tab to select the next item in the completion menu
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i", "s" }), -- Works in insert & select mode

    -- Use Shift+Tab to select the previous item
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i", "s" }),

    -- Bind <C-o> to trigger the completion menu manually
    ["<C-o>"] = cmp.mapping.complete(),

    -- Bind <C-e> to abort/close the completion menu
    ["<C-e>"] = cmp.mapping.abort(),

    -- Bind <CR> to confirm the selected completion item (with automatic selection)
    ["<A-CR>"] = cmp.mapping.confirm({ select = true }),
  }),

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  -- Configure completion sources
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- Use LSP for completions
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },    -- Use buffer completions as a fallback
  }),
})

