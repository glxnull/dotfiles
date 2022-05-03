local packer = require('packer')

-- Use packer as a popup
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end
  },
}

-- Plugins
packer.startup(function(use)
  use { 'wbthomason/packer.nvim' }

  use { 'neovim/nvim-lspconfig' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path'
    }
  }
  use { 'mhartington/formatter.nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'editorconfig/editorconfig-vim' }

  use { 'rebelot/kanagawa.nvim' }
  use { 'tiagovla/tokyodark.nvim' }
  use { 'folke/tokyonight.nvim' }
end)
