set packpath^=~/.vim
packadd minpac

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
call minpac#add('mileszs/ack.vim')
call minpac#add('jremmen/vim-ripgrep')
call minpac#add('w0rp/ale')
" call minpac#add('Shougo/deoplete.nvim')
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
if (has("nvim"))
  call minpac#add('mattn/emmet-vim')
endif
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('junegunn/fzf.vim')
call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('tpope/vim-commentary')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('tpope/vim-fugitive')
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('mhinz/vim-mix-format')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('fatih/vim-go')
call minpac#add('rust-lang/rust.vim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')
call minpac#add('rhysd/vim-crystal')
call minpac#add('dleonard0/pony-vim-syntax')
call minpac#add('terryma/vim-multiple-cursors')
call minpac#add('prettier/vim-prettier')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('tpope/vim-surround')
call minpac#add('wakatime/vim-wakatime')
call minpac#add('matze/vim-move')
call minpac#add('ElmCast/elm-vim')
call minpac#add('rust-lang/rust.vim')
" call minpac#add('racer-rust/vim-racer')
call minpac#add('mustache/vim-mustache-handlebars')
call minpac#add('janko/vim-test')
call minpac#add('leafgarland/typescript-vim')

" themes
call minpac#add('rakr/vim-one')
call minpac#add('mhartington/oceanic-next')
call minpac#add('jordwalke/flatlandia')
call minpac#add('challenger-deep-theme/vim')
call minpac#add('machakann/vim-highlightedyank')

" not yet using
" call minpac#add('tomtom/tlib_vim')
" call minpac#add('MarcWeber/vim-addon-mw-utils')
" call minpac#add('garbas/vim-snipmate')

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

  " show the replacements
  set inccommand=nosplit
endif

" load custom settings
" source ~/.dotfiles/.vim/custom.vim
" source ~/dotfiles/vim/vimrc.vim

" #### VIM TEST MAPPINGS ####
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
