local packer = require('packer')

packer.startup(function(use)
  use { 'wbthomason/packer.nvim' }

  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'editorconfig/editorconfig-vim' }

  use { 'rebelot/kanagawa.nvim' }
  use { 'tiagovla/tokyodark.nvim' }
  use { 'folke/tokyonight.nvim' }
end)
