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

-- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path'
    }
  }
  use {
    'L3MON4D3/LuaSnip',
    requires = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    }
  }
  use { 'mhartington/formatter.nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'onsails/lspkind.nvim' }

-- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

-- Utils
  use { 'editorconfig/editorconfig-vim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }

-- Themes
  use { 'rebelot/kanagawa.nvim' }
  use { 'tiagovla/tokyodark.nvim' }
  use { 'folke/tokyonight.nvim' }
  use { 'EdenEast/nightfox.nvim' }
end)
