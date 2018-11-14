" Plugin manager
call plug#begin('~/.local/share/nvim/plugged')

" Essential plugins
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'

" Autocomplete support
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" C/C++
Plug 'vhdirk/vim-cmake'
Plug 'bbchung/Clamp'

" Python
Plug 'vim-python/python-syntax'
Plug 'zchee/deoplete-jedi'

" Web development
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'othree/csscomplete.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'leshill/vim-json'
Plug 'prettier/vim-prettier'

" Utils
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/vim-gfm-syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Themes
Plug 'wimstefan/vim-artesanal'
Plug 'dim13/smyck.vim'
Plug 'crusoexia/vim-monokai'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ajh17/Spacegray.vim'

call plug#end()

" General settings {{{
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set linespace=3
set foldmethod=indent
set foldlevel=99
set number
set title
set autoindent
set smartindent
set updatetime=100
set noshowmode
set laststatus=2
set showtabline=2

if has('termguicolors')
    set termguicolors
endif

syntax enable
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

let base16colorspace=256
set background=dark
colorscheme PaperColor

set completeopt-=preview
set cursorline
highlight CursorLine term=bold cterm=bold guibg=#555753

" Move between buffers with Shift + arrow key
nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>

" Split buffers
nnoremap <C-z> :vsplit<CR>
nnoremap <C-x> :split<CR>

" }}}

" Lightline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component': {
    \   'lineinfo': ' %3l:%-2v'
    \ },
    \ 'component_function': { 'gitbranch': 'fugitive#head' },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ }
let g:lightline.separator    = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

let g:lightline#bufferline#enable_devicons= 1
let g:lightline.tabline          = { 'left': [ [ 'buffers' ] ], 'right': [ [ 'close' ] ] }
let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = { 'buffers': 'tabsel' }
let g:lightline#bufferline#modified= ' ✱'

" Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_nerdtree = 1

" NERDTree
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <F8> :NERDTreeToggle<CR>

let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
    \ ]

" Tagbar
nmap <F5> :TagbarToggle<CR>

" CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = '\.git$\|node_modules$\'

" Linter settings
let g:ale_completion_enabled = 0
let g:ale_linters_explicit= 1

let g:ale_fixers = {
    \ 'cpp': [ 'clang' ],
    \ 'python': [ 'flake8', 'pylint' ],
    \ 'javascript': [ 'eslint', 'prettier' ]
    \ }

let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:ale_sign_column_always = 1

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0

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

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif

call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

call deoplete#custom#option('sources', {
            \ 'python3': ['LanguageClient'],
            \ 'c': ['LanguageClient'],
            \ 'cpp': ['LanguageClient'],
            \ 'javascript': ['LanguageClient'],
            \ 'vim': ['vim']
            \})

let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'around']

" Language Client
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
            \ 'cpp': ['clangd'],
            \ 'c': ['clangd'],
            \ 'python': ['pyls'],
            \ 'javascript': [ 'javascript-typescript-stdio' ]
            \ }

let g:LanguageClient_rootMarkers = {
            \ 'cpp': ['compile_commands.json', 'build'],
            \ 'c': ['compile_commands.json', 'build'],
            \ }

set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

" C++
let g:clamp_autostart = 1
let g:clamp_libclang_file = '/usr/lib/llvm-6.0/lib/libclang.so'

" Python
let g:python3_host_prog = '/usr/bin/python3'
let g:python_highlight_all = 1

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Web Development
au BufNewFile,BufRead *.js,*.html
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd BufWritePre *.jsx,*.js,*.json,*.css,*.scss,*.less,*.graphql Prettier

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

let g:latex_indent_enabled = 1
let g:latex_fold_envs = 0
let g:latex_fold_sections = []
