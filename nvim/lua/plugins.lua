return {
  {
    'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = 'VeryLazy',
	config = function()
      require('config.lualine')
    end,
  },
  {
    'windwp/nvim-autopairs',
	config = true,
	event = 'BufReadPost',
  },
  {
    'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
    lazy = false,
	config = function()
      require('config.treesitter')
    end,
  },
  -- LSP, linting and formatting
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
      require('config.lsp.lspconfig')
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
    },
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('config.lsp.nvim-cmp')
    end,
  },
  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('config.conform')
    end,
  },
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('config.linting')
    end,
  },
  -- Colorschemes
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },
  {
    'Shatur/neovim-ayu',
    priority = 1000,
  },
  {
    'slugbyte/lackluster.nvim',
    priority = 1000,
  },
}
