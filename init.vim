" Plugin manager
call plug#begin('~/.local/share/nvim/plugged')

" Essential plugins
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
Plug 'w0rp/ale'

" Autocomplete support
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim'

" C/C++
Plug 'zchee/deoplete-clang'
Plug 'bbchung/Clamp'
Plug 'vhdirk/vim-cmake'

" Python
Plug 'zchee/deoplete-jedi'

" Go
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make' }

" Web development
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'skammer/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/csscomplete.vim'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'posva/vim-vue'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript'] }

" Utils
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/vim-gfm-syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'JuliaEditorSupport/julia-vim'

" Themes
Plug 'wimstefan/vim-artesanal'
Plug 'dim13/smyck.vim'
Plug 'crusoexia/vim-monokai'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" General settings {{{
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set foldmethod=indent
set foldlevel=99
set number
set title
set autoindent
set smartindent
set updatetime=100
set noshowmode

if has('termguicolors')
    set termguicolors
endif

syntax enable
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

if has('gui_running')
    set background=dark
    colorscheme smyck
else
    set background=dark
    colorscheme PaperColor
endif
set completeopt-=preview

set cursorline
highlight CursorLine term=bold cterm=bold guibg=#555753

" Move between buffers with Shift + arrow key
nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>

" Split buffers
nnoremap <C-z> :vsplit<CR>
nnoremap <C-x> :split<CR>

" Enable deoplete
let g:deoplete#enable_at_startup = 1
" }}}

" Vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'minimalist'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_nerdtree = 1

" NERDTree
nnoremap <leader>d :NERDTreeToggle<CR>
map <F8> :NERDTreeToggle<CR>

let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
\]

" Tagbar
nmap <F5> :TagbarToggle<CR>

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = '\.git$\|node_modules$\'

" Linter settings
let g:ale_fixers = {
            \ 'c++': ['clang'],
            \ 'go': ['gofmt'],
            \ 'python': ['flake8'],
            \ 'javascript': ['eslint']
            \}

let g:ale_cpp_clang_options = '-std=c++17 -Wall'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_sign_column_always = 1

let g:airline#extensions#ale#enabled = 1

" Snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-b>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'

let g:UltiSnipsEditSplit = 'vertical'

" Vim slime
let g:slime_target = 'tmux'

" Better Whitespace
hi ExtraWhitespace guibg=#E06C75

" Languages {{{

" C++
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/6.0.0'

let g:clamp_autostart = 1
let g:clamp_libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so'

" Python

let g:python3_host_prog = '/usr/bin/python3'

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Go
let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" Web Development
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

let g:deoplete#sources = {}
"let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" }}}

" Github markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

let g:gfm_syntax_enable_always = 0
let g:gfm_syntax_enable_filetypes = ['markdown.gfm']
autocmd BufRead,BufNew,BufNewFile README.md setlocal ft=markdown.gfm

" LaTeX
autocmd FileType tex setl updatetime=1
let g:livepreview_previewer = 'okular'
