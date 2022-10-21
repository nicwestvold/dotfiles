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

set incsearch
set hlsearch

filetype plugin on
set ai " autoindent
set si " smartindent
set ignorecase
set smartcase

set noerrorbells
set nowrap
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

call plug#begin('~/.vim/plugged')

""" functionality
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'sethlowie/vim-test'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'

" Git worktree
Plug 'ThePrimeagen/git-worktree.nvim'
" status bar
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-lua/popup.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

""" languages
"" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
"" JS/TS
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'
"" Elm
Plug 'ElmCast/elm-vim'
"" svelte
Plug 'evanleck/vim-svelte', {'branch': 'main'}

""" utility
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'branch': 'release/1.x' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'machakann/vim-highlightedyank'

""" themes / styling
" used in nerdtree
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'romgrk/doom-one.vim'
Plug 'EdenEast/nightfox.nvim'

call plug#end()



let mapleader=" "


set rtp+=/usr/local/opt/fzf

" run prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.svelte PrettierAsync

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
" quit NERDTree when opening file
let NERDTreeQuitOnOpen = 1
" enable line numbers
let NERDTreeShowLineNumbers = 1
" show hidden files
let NERDTreeShowHidden=1
" use relative line numbers
autocmd FileType nerdtree setlocal relativenumber
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader><cr> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" only prefer to count using decimal and base 10 numbers
set nrformats=

" neovim settings
if (has("nvim"))
  " this helps neovim match the colors
  if (has("termguicolors"))
    set termguicolors
  endif

  colorscheme one
  set background=dark


  " this prevent neovim from changing the cursor on insert mode
  set guicursor=
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " CoC setup
  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: There's always complete item selected by default, you may want to enable
  " no select by `"suggest.noselect": true` in your configuration file.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
  
  " Make <CR> to accept selected completion item or notify coc.nvim to format
  " <C-g>u breaks current undo, please make your own choice.
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  
  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  
  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif
  
  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  
  " GoTo code navigation.
  nmap <leader>gd <Plug>(coc-definition)
  nmap <leader>gy <Plug>(coc-type-definition)
  nmap <leader>gi <Plug>(coc-implementation)
  nmap <leader>gr <Plug>(coc-references)
  nmap <silent> <Leader>v <Plug>(coc-fix-current)
  
  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction
  " Use K to show documentation in preview window.
  nnoremap <silent> K :call ShowDocumentation()<CR>

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  
  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " show the replacements
  set inccommand=nosplit
endif

" remaps
nnoremap Y y$

" keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv

" jumplist mutation
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" #### VIM TEST MAPPINGS ####
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" coc-tsserver has been giving linting errors. `:set ft` revealed that it
" thought the filetype was "typescript" instead of "typescriptreact"
augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END

" Elm stuff
autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 expandtab

" install coc plugins on update/install
let g:coc_global_extensions = [
      \ 'coc-css',
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-go',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-fzf-preview',
      \ 'coc-prettier',
      \ 'coc-rls',
      \ 'coc-tailwindcss',
      \ 'coc-tslint-plugin',
      \ 'coc-tsserver',
      \ 'coc-yank',
      \ ]

" Telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" GIT
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gc :Gcommit -v<CR>
nmap <leader>gs :G<CR>
nmap <leader>gi :GoImplements<CR>

nmap <silent> <Leader>af :CocCommand eslint.executeAutofix<CR>

" move selected lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Find
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" git worktree
nnoremap <leader>w :lua require("telescope").extensions.git_worktree.git_worktrees()<cr>
nnoremap <leader>nw :lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>

" syntax highlighting
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
