local telescope = require('telescope')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')

local rg_cmd = { 'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' }

telescope.setup {
  defaults = {
    find_command = rg_cmd,
    initial_mode = 'insert',
    prompt_position = 'top',
    prompt_prefix = ' ❯',
    file_ignore_patterns = { '.git/*', 'node_modules', 'env/*' },
    colors_devicons = true,
    winblend = 20,
    file_sorter = sorters.get_fzy_sorter,
    generic_sorter = sorters.get_fzy_sorter,
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<Esc>'] = actions.close,
      },
    },
  },
  extensions = {},
}

vim.keymap.set('n', '<C-f>', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>lr', ':Telescope lsp_references<CR>')
vim.keymap.set('n', '<leader>ds', ':Telescope lsp_document_symbols<CR>')

