-- Mason setup for automatic installation of LSPs and other dependencies
require("mason").setup()

-- Mason-LSPconfig setup for ensuring that the required LSPs are installed
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",        -- Lua Language Server
    "pyright",       -- Python LSP
    "clangd",        -- C LSP
    "ts_ls",         -- TypeScript LSP (replaces deprecated tsserver)
    "html",          -- HTML LSP
    "cssls",         -- CSS LSP
    "jdtls",         -- Java LSP
  }
})

-- Define the function to be called when an LSP server attaches to a buffer
local on_attach = function(client, bufnr)
  -- Key mappings for LSP-related actions
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr })  -- Rename symbol
  vim.keymap.set('n', '<leader>cd', vim.lsp.buf.code_action, { buffer = bufnr })  -- Code action

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr })  -- Go to definition
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr })  -- Go to implementation
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, { buffer = bufnr })  -- LSP references via Telescope
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })  -- Hover to show documentation
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup the lua_ls LSP configuration
require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',  -- You can change this to 'Lua 5.1', 'Lua 5.2', etc. based on your needs
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},  -- Recognizes Neovim's global `vim` variable
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),  -- Allow Neovim runtime files to be loaded
      },
      telemetry = {
        enable = false,  -- Disable telemetry data collection
      },
    },
  },
}

-- Setup the pyright (Python) LSP configuration
require("lspconfig").pyright.setup {
  on_attach = on_attach,
}

-- Setup the clangd (C) LSP configuration
require("lspconfig").clangd.setup {
  on_attach = on_attach,
}

-- Setup the ts_ls (TypeScript) LSP configuration (Updated)
require("lspconfig").ts_ls.setup {
  on_attach = on_attach,
}

-- Setup the html (HTML) LSP configuration
require("lspconfig").html.setup {
  on_attach = on_attach,
}

-- Setup the cssls (CSS) LSP configuration
require("lspconfig").cssls.setup {
  on_attach = on_attach,
}

-- Setup the jdtls (Java) LSP configuration
require("lspconfig").jdtls.setup {
  on_attach = on_attach,
}

