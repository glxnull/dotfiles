set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set linespace=2
set foldlevel=99
set nu
set title
set autoindent
set smartindent
set updatetime=100
set noshowmode
set laststatus=2
set showtabline=2

syntax enable
set background=dark

if has('termguicolors')
  set termguicolors
end

let g:tokyodark_transparent_background = 0
let g:tokyodark_enable_italic = 1
let g:tokyodark_color_gamma = "1.0"
colorscheme tokyodark

let g:python3_host_prog = expand("python3")

lua require('init')
