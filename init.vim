" Plugin manager
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'skammer/vim-css-color'
Plug 'vhdirk/vim-cmake'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ekalinin/Dockerfile.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/vim-gfm-syntax'
Plug 'airblade/vim-gitgutter'
Plug 'othree/html5.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'jpalardy/vim-slime'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'arakashic/chromatica.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'carlitux/deoplete-ternjs'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go'

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

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_nerdtree = 1

" NERDTree
map <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Tagbar
nmap <F5> :TagbarToggle<CR>

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = '\.git$\|node_modules$\'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers=['flake8', 'python3']

let g:syntastic_cpp_checkers = ['clang']
let g:syntastic_cpp_compiler = 'clang'
let g:syntastic_cpp_compiler_options = '-std=c++14'

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_tex_checkers = ['lacheck']

let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '!✗'
let g:syntastic_style_warning_symbol = '⁉️'

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

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:cpp_class_scope_highlight = 1

let g:chromatica#enable_at_startup = 1
let g:chromatica#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so'

" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

if has('neovim')
    let g:python3_host_prog = '/usr/bin/python3'
endif

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

let g:deoplete#sources#ternjs#timeout = 1

" }}}

" Github markdown
let g:gfm_syntax_enable_always = 0
let g:gfm_syntax_enable_filetypes = ['markdown.gfm']
autocmd BufRead,BufNew,BufNewFile README.md setlocal ft=markdown.gfm

" LaTeX
autocmd FileType tex setl updatetime=1
let g:livepreview_previewer = 'okular'
