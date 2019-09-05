" Plugin manager
call plug#begin('~/.local/share/nvim/plugged')

" Essential plugins
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
Plug 'Chiel92/vim-autoformat'

" Autocomplete support
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" C/C++
Plug 'richq/vim-cmake-completion'
Plug 'pboettch/vim-cmake-syntax'

" Python
Plug 'vim-python/python-syntax'

" Web development
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'othree/csscomplete.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'leshill/vim-json'

" Utils
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'reedes/vim-pencil'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/vim-gfm-syntax'
Plug 'ekalinin/Dockerfile.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'cespare/vim-toml'

" Themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'christophermca/meta5'
Plug 'kjssad/quantum.vim'
Plug 'cocopon/lightline-hybrid.vim'

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

set background=dark
colorscheme quantum
let g:enable_bold_font = 1

set completeopt-=preview
set cursorline
highlight CursorLine term=bold cterm=bold guibg=#555753
hi Normal guibg=NONE ctermbg=NONE

" Move between buffers
nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>

" Split buffers
nnoremap <C-j> :vsplit<CR>
nnoremap <C-m> :split<CR>
" }}}

" Lightline
let g:lightline = {
    \ 'colorscheme': 'quantum',
    \ 'component': {
    \   'lineinfo': ' %3l:%-2v'
    \ },
    \ 'component_function': {
            \ 'gitbranch': 'FurgitiveBranch',
            \ 'filetype': 'DevIconsFiletype',
            \ 'fileformat': 'DevIconsFileformat',
            \ },
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ }

let g:lightline.separator    = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba " }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }

let g:lightline.tabline          = { 'left': [ [ 'buffers' ] ], 'right': [ [ 'close' ] ] }
let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = { 'buffers': 'tabsel' }

let g:lightline#bufferline#modified = ' ✱'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unnamed = 'No Name'

function! FurgitiveBranch()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head())
            return ' ' . fugitive#head()
        endif
    catch
    endtry
    return ''
endfunction

" Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

function! DevIconsFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! DevIconsFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" NERDTree
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <F8> :NERDTreeToggle<CR>

let NERDTreeStatusline = '%8*%=%7*NERD%8*%='
let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
    \ ]

" Linter settings
let g:ale_completion_enabled = 0
let g:ale_linters_explicit= 1

let g:ale_fixers = {
    \ 'cpp': ['ccls'],
    \ 'c': ['ccls'],
    \ 'python': ['flake8', 'pylint'],
    \ 'javascript': ['prettier'],
    \ 'rust': ['rustfmt'],
    \ }

let g:ale_cpp_clang_options = '-std=c++17 -Wall -Wextra'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

let g:ale_sign_column_always = 1

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 0
let g:ale_lint_on_enter = 0

" Autoformat
noremap <F3> :Autoformat<CR>

" Snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-b>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'

let g:UltiSnipsEditSplit = 'vertical'

" Vim slime
let g:slime_target = 'tmux'

" Better Whitespace
hi ExtraWhitespace guibg=#E06C75

" Vista
nnoremap <silent><F6> :Vista!!<CR>

let g:vista_sidebar_width = 45
let g:vista_disable_statusline = 1

let g:vista#renderer#icon = 1
let g:vista_icon_indent = ['▸ ', '']

let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
            \ 'c': 'lcn',
            \ 'cpp': 'lcn',
            \ 'python': 'lcn',
            \ }

let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#icons = {
            \ 'function': '\uf794',
            \ 'module': '\uf6a6',
            \ 'variable': '\uf71b',
            \ }

" FZF
nnoremap <silent><C-p> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

let g:fzf_actions = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit',
            \ }

let g:fzf_layout = { 'down': '~40%' }

let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

let g:fzf_colors = {
            \ 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'],
            \ }

let g:fzf_history_dir = '~/.local/share/fzf-history'

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
            \ 'rust': ['LanguageClient'],
            \ 'vim': ['vim'],
            \ })

let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['buffer', 'around']

" Language Client
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['ccls', '--log-file=/tmp/ccls.log'],
            \ 'c': ['ccls', '--log-file=/tmp/ccls.log'],
            \ 'python': ['pyls'],
            \ 'javascript': ['javascript-typescript-stdio'],
            \ 'rust': ['rls'],
            \ }

let g:LanguageClient_rootMarkers = {
            \ 'cpp': ['.ccls', 'compile_commands.json', 'build', '.vim/', '.git/'],
            \ 'c': ['.ccls', 'compile_commands.json', 'build', '.vim/', '.git/'],
            \ }

let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'
let g:LanguageClient_hasSnippetSupport = 0

set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

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
autocmd BufWritePre *.jsx,*.js,*.json,*.graphql Prettier

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
