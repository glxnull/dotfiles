local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  highlight = {
    enable = true,
    disable = {};
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "toml",
    "json",
    "yaml",
    "html",
    "scss",
    "javascript",
    "php" -- Temp
  },
}

-- local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { 'javascript', 'javascript.jsx' }
