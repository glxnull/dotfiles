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

colorscheme nightfox

let mapleader = ' '

let g:python3_host_prog = expand('/usr/bin/python3')

lua require('init')
