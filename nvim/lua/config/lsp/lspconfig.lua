local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup lang servers
lspconfig.tailwindcss.setup {
  filetypes = { 'vue', 'astro', 'html' },
  typescript = {},
  capabilities = capabilities,
}

lspconfig.ts_ls.setup {
  filetypes = { 'vue', 'javascript', 'typescript' },
  capabilities = capabilities,
}

lspconfig.volar.setup {
  filetypes = { 'typescript', 'javascript', 'vue', 'json' },
  capabilities = capabilities,
}
