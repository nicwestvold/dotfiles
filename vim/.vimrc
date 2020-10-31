syntax on

set hidden
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
" absolute line numbers + relative line numbers
set nu rnu
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" spellcheck
" setlocal spell spelllang=en_us

set incsearch
" highlight search
set hlsearch

" mine
filetype plugin on
set ai " autoindent
set si " smartindent
set ignorecase
set smartcase

" primeagean
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" end primeagean


call plug#begin('~/.vim/plugged')

" functionality
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'
Plug 'janko/vim-test'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'

" languages
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
" call minpac#add('racer-rust/vim-racer')
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ElmCast/elm-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi', { 'do': 'npm -g install typescript' }
Plug 'rhysd/vim-crystal'
Plug 'dleonard0/pony-vim-syntax'

" utility
" Plug 'w0rp/ale'
" Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mileszs/ack.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/1.x' }
Plug '/usr/local/bin/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'yuki-ycino/fzf-preview.vim'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release', 'do': ':UpdateRemotePlugins' }

Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'wakatime/vim-wakatime'
Plug 'aserebryakov/vim-todo-lists'

" themes / styling
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhartington/oceanic-next'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'machakann/vim-highlightedyank'

" games
Plug 'ThePrimeagen/vim-be-good'

" not yet using
" call minpac#add('tomtom/tlib_vim')
" call minpac#add('MarcWeber/vim-addon-mw-utils')
" call minpac#add('garbas/vim-snipmate')

call plug#end()



let mapleader=" "


set rtp+=/usr/local/opt/fzf

" run prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1
" let g:polyglot_disabled = ['elm']
" let g:elm_format_autosave = 1

" for devicons
set encoding=utf8
" status line settings
" use powerline fonts
let g:airline_powerline_fonts = 1
" always show the last status
set laststatus=2

" JSX plugin settings. allow both .js and .jsx
let g:jsx_ext_required = 0

" format {ex,exs} on save (mix format is available on elixir >= 1.6)
let g:mix_format_on_save = 1

" format rust on save
let g:rustfmt_autosave = 1

" NERDTree
autocmd StdinReadPre * let s:std_in=1
map <C-m> :NERDTreeToggle<CR>
" quit NERDTree when opening file
let NERDTreeQuitOnOpen = 1
" enable line numbers
let NERDTreeShowLineNumbers = 1
" use relative line numbers
autocmd FileType nerdtree setlocal relativenumber

" only prefer to count using decimal and base 10 numbers
set nrformats=

" neovim settings
if (has("nvim"))
  " this helps neovim match the colors
  if (has("termguicolors"))
    set termguicolors
  endif

  " set background=dark
  " colorscheme palenight

  colorscheme one
  set background=dark

  " colorscheme dracula

  " set termguicolors     " enable true colors support
  " let ayucolor="light"  " for light version of theme
  " let ayucolor="mirage" " for mirage version of theme
  " let ayucolor="dark"   " for dark version of theme
  " colorscheme ayu

  " this prevent neovim from changing the cursor on insert mode
  set guicursor=
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " colorscheme nord
  " let g:airline_theme='nord'
  " let g:oceanic_next_terminal_bold = 1
  " let g:oceanic_next_terminal_italic = 1
  " colorscheme OceanicNext
  " let g:airline_theme='oceanicnext'
  " https://github.com/mhartington/oceanic-next/issues/40
  " set t_ut=

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

  nmap <leader>gd <Plug>(coc-definition)
  nmap <leader>gr <Plug>(coc-references)
  " nmap <silent> <leader>gt <Plug>(coc-type-definition)
  nmap <silent> <Leader>v <Plug>(coc-fix-current)
  nnoremap <silent> <leader>gt :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
endif

" #### VIM TEST MAPPINGS ####
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" TYPESCRIPT STUFF
" autocmd FileType typescript.tsx nmap <buffer> <leader>gt :<C-u>echo tsuquyomi#hint()<CR>
" autocmd FileType typescript nmap <buffer> <leader>gt :<C-u>echo tsuquyomi#hint()<CR>

" Elm stuff
autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 expandtab

" install coc plugins on update/install
" let g:coc_global_extensions = [
"       " \ 'coc-tslint-plugin',
"       \ 'coc-tsserver',
"       " \ 'coc-emmet',
"       " \ 'coc-css',
"       " \ 'coc-html',
"       " \ 'coc-json',
"       " \ 'coc-yank',
"       " \ 'coc-prettier',
"       \ 'coc-fzf-preview',
"       \ 'coc-rls',
"       \ 'coc-eslint'
"       \ ]

" noremap <C-p> :GFiles<CR>
nnoremap <C-p> :CocCommand fzf-preview.DirectoryFiles <Cr>

" GIT
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>gs :G<CR>

nmap <silent> <Leader>af :CocCommand eslint.executeAutofix<CR>

" move selected lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Find
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" if executable('rg')
"   let g:rg_derive_root='true'
" endif
