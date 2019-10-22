call plug#begin('~/.vim/plugged')

" set packpath^=~/.vim
" packadd minpac

" call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
" call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
Plug 'mileszs/ack.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'w0rp/ale'
" call minpac#add('Shougo/deoplete.nvim')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
if (has("nvim"))
  Plug 'mattn/emmet-vim'
endif
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rhysd/vim-crystal'
Plug 'dleonard0/pony-vim-syntax'
Plug 'terryma/vim-multiple-cursors'
Plug 'prettier/vim-prettier'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'wakatime/vim-wakatime'
Plug 'matze/vim-move'
Plug 'ElmCast/elm-vim'
Plug 'rust-lang/rust.vim'
" call minpac#add('racer-rust/vim-racer')
Plug 'mustache/vim-mustache-handlebars'
Plug 'janko/vim-test'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-syntastic/syntastic'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" themes
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'
Plug 'jordwalke/flatlandia'
Plug 'challenger-deep-theme/vim'
Plug 'machakann/vim-highlightedyank'

" not yet using
" call minpac#add('tomtom/tlib_vim')
" call minpac#add('MarcWeber/vim-addon-mw-utils')
" call minpac#add('garbas/vim-snipmate')

call plug#end()

set nocompatible
set incsearch
set hlsearch

syntax on
filetype plugin on

set number
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=0
set tabstop=2

let mapleader=","

set ai
set si

set ignorecase
set smartcase

set rtp+=/usr/local/opt/fzf

" automatically change directories
" set autochdir

" run prettier on save
" let g:prettier#autoformat = 0
" let g:prettier#config#print_width = 100
" let g:prettier#config#bracket_spacing = 'true'
" let g:prettier#config#parser = 'babylon'
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

" let g:javascript_plugin_flow = 1
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'elixir': ['mix_format'],
\   'javascript': ['eslint'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

let g:polyglot_disabled = ['elm']
let g:elm_format_autosave = 1

" for devicons
set encoding=utf8
" status line settings
" use powerline fonts
let g:airline_powerline_fonts = 1
" always show the last status
set laststatus=2
" let g:airline_theme='one'

" golang -> https://github.com/fatih/vim-go-tutorial#check-it
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = ['vet', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet']
let g:go_metalinter_deadline = "5s"

" JSX plugin settings. allow both .js and .jsx
let g:jsx_ext_required = 0

" format {ex,exs} on save
let g:mix_format_on_save = 1

" format rust on save
let g:rustfmt_autosave = 1

" NERDTree
" open NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" shortcut to toggle
" map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTreeToggle<CR>
" quit NERDTree when opening file
let NERDTreeQuitOnOpen = 1
" enable line numbers
let NERDTreeShowLineNumbers = 1
" use relative line numbers
autocmd FileType nerdtree setlocal relativenumber

" only prefer to count using decimal and base 10 numbers
set nrformats=

" these two cause an error in neovim
" set winheight=30
" set winminheight=5

if (has("nvim"))
  " this helps neovim match the colors
  if (has("termguicolors"))
    set termguicolors
  endif

  " this prevent neovim from changing the cursor on insert mode
  set guicursor=
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " setting the theme
  " colorscheme challenger_deep
  " colorscheme flatlandia
  " let g:airline_theme='flatlandia'
  colorscheme OceanicNext
  let g:airline_theme='oceanicnext'
  " https://github.com/mhartington/oceanic-next/issues/40
  set t_ut=
  " colorscheme one
  " set background=dark

  " Use deoplete.
  " let g:deoplete#enable_at_startup = 1
  " CoC setup
  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " show the replacements
  set inccommand=nosplit
endif

" Allows Emmet Expansion with the Tab key
let g:user_emmet_leader_key=','

" load custom settings
" source ~/.dotfiles/.vim/custom.vim
" source ~/dotfiles/vim/vimrc.vim

" #### VIM TEST MAPPINGS ####
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" TYPESCRIPT STUFF
autocmd FileType typescript.tsx nmap <buffer> <leader>gt :<C-u>echo tsuquyomi#hint()<CR>

" GLOBAL GO TO
function GoTo()
  if &filetype ==# 'typescript' || &filetype ==# 'typescript.tsx'
    call tsuquyomi#definition()
  elseif &filetype ==# 'go'
    call go#def#Jump('', 0)
  else
    echo &filetype
  endif
endfunction
nmap <silent> <leader>gd :call GoTo()<CR>
