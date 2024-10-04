local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Language servers
lspconfig.tailwindcss.setup {
  filetypes = { 'html' },
  typescript = {},
  capabilities = capabilities,
}

lspconfig.ts_ls.setup {
  filetypes = { 'javascript', 'typescript' },
  capabilities = capabilities,
}
