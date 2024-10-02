local ts = require('nvim-treesitter.configs')

ts.setup {
  highlight = {
    enable = true,
	additional_vin_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true,
	enable_autocmd = false,
  },
  ensure_installed = {
    'lua',
	'html',
	'css',
	'javascript',
	'typescript',
	'json',
	'tsx',
    'vue',
  },
  rainbow = {
    enable = true,
	disable = { 'html' },
	extended_mode = false,
	max_file_lines = nil,
  },
  autotag = { enable = true },
  incremental_section = { enable = true },
  indent = { enable = true },
}

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.tsx.filtype_to_parsername = { 'javascript', 'typescript.tsx' }
