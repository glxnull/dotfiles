local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup {
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ["<C-S-Space>"] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ["<CR>"] = function(fallback)
      if cmp.visible() then
        cmp.confirm { select = true }
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'treesitter' },
    { name = 'path' },
    { name = 'luasnip' },
    { 
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      maxwidth = 50,
      menu = {
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        path = '[Path]',
        luasnip = '[Snippet]'
      },
    },
  },
}
