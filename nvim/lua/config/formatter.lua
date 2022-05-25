local formatter = require('formatter')

formatter.setup {
  filetype = {
    javascript = {
      -- prettier
      require('formatter.filetypes.javascript').prettier,
      require('formatter.filetypes.javascriptreact').prettier,
    },
  }
}

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx FormatWrite
augroup END
]], true)
