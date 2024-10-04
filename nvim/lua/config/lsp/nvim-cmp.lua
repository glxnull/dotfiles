local cmp = require('cmp')

vim.opt.completeopt = 'menu,menuone,noselect'

local icons = {
  Class = '󰠱',
  Constructor = '󰒔',
  Function = '󰯼',
  Keyword = '',
  Module = '󰆧',
  Text = '󱀍',
  Variable = '󰰪',
  Constant = '󰯱',
  Folder = '',
}

cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    -- { name = 'nvim_lsp' }, TODO: add snippets engine
    { name = 'buffer' },
    { name = 'path' },
  }),
  window = {
    completion = cmp.config.window.bordered({
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    }),
    documentation = cmp.config.window.bordered({
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    }),
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = (icons[vim_item.kind] or '') .. ' ' .. vim_item.kind
      return vim_item
    end,
  },
}
