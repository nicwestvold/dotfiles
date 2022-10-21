require("settings")
require("plugins")

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- empty setup using defaults
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
    number = true,
    relativenumber = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
})

vim.keymap.set('n', '<leader><cr>', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', { noremap = true })
vim.keymap.set('n', '<C-f>', ':NvimTreeFindFile<CR>', { noremap = true })

-- GitLens
-- vim.api.nvim_create_autocmd("CursorHold", {
--     pattern = { "*" },
--     command = "lua require'gitblame'.blameVirtText()",
-- })
-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--     pattern = { "*" },
--     command = "lua require'gitblame'.clearBlameVirtText()",
-- })

vim.g.mapleader = " "

vim.cmd([[
    set rtp+=/usr/local/opt/fzf

    " run prettier on save
    let g:prettier#autoformat = 0
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.svelte PrettierAsync
]])

-- " for devicons
vim.o.encoding = 'utf8'

-- " use powerline fonts
vim.g.airline_powerline_fonts = 1
-- " always show the last status
vim.o.laststatus = 2

-- " JSX plugin settings. allow both .js and .jsx
vim.g.jsx_ext_required = 0
-- " format {ex,exs} on save (mix format is available on elixir >= 1.6)
-- let g:mix_format_on_save = 1
vim.g.mix_format_on_save = 1
-- " format rust on save
vim.g.rustfmt_autosave = 1

-- only prefer to count using decimal and base 10 numbers
-- set nrformats=
vim.o.nrformats = ''

vim.cmd([[
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
        inoremap <silent><expr> <c-space> coc#refresh()
      
      " Use `[g` and `]g` to navigate diagnostics
      " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
      nmap <silent> [g <Plug>(coc-diagnostic-prev)
      nmap <silent> ]g <Plug>(coc-diagnostic-next)
]])

-- GoTo code navigation.
vim.keymap.set('n', '<leader>gd', '<Plug>(coc-definition)', {})
vim.keymap.set('n', '<leader>gt', '<Plug>(coc-type-definition)', {})
vim.keymap.set('n', '<leader>gi', '<Plug>(coc-implementation)', {})
vim.keymap.set('n', '<leader>gr', '<Plug>(coc-references)', {})
vim.keymap.set('n', '<leader>v', '<Plug>(coc-fix-current)', {})

vim.cmd([[
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

    " keep it centered
    nnoremap n nzzzv
    nnoremap N Nzzzv
    " nnoremap J mzJ`z

    " jumplist mutation
    nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
    nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

    " coc-tsserver has been giving linting errors. `:set ft` revealed that it
    " thought the filetype was "typescript" instead of "typescriptreact"
    augroup ReactFiletypes
      autocmd!
      autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
      autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
    augroup END

    " Elm stuff
    autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 expandtab
]])

-- Moving text
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true})
vim.keymap.set('i', '<C-j>', "<esc>:m .+1<CR>==", { noremap = true })
vim.keymap.set('i', '<C-k>', "<esc>:m .-2<CR>==", { noremap = true })
vim.keymap.set('n', '<leader>j', ":m .+1<CR>==", { noremap = true })
vim.keymap.set('n', '<leader>k', ":m .-2<CR>==", { noremap = true })

-- " #### VIM TEST MAPPINGS ####
vim.keymap.set('n', '<leader>tn', ":TestNearest<CR>", { silent = true })
vim.keymap.set('n', '<leader>tf', ":TestFile<CR>", { silent = true })
vim.keymap.set('n', '<leader>ts', ":TestSuite<CR>", { silent = true })
vim.keymap.set('n', '<leader>tl', ":TestLast<CR>", { silent = true })
vim.keymap.set('n', '<leader>tg', ":TestVisit<CR>", { silent = true })

-- CoC - install coc plugins on update/install
vim.cmd([[
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

      nmap <silent> <Leader>af :CocCommand eslint.executeAutofix<CR>
]])

-- Find
vim.cmd([[command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)]])

-- syntax highlighting
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*.{js,jsx,ts,tsx}" },
    command = "syntax sync fromstart",
})
vim.api.nvim_create_autocmd("BufLeave", {
    pattern = { "*.{js,jsx,ts,tsx}" },
    command = "syntax sync clear",
})

vim.keymap.set('n', 'Y', 'y$', {noremap = true})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { noremap = true })
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
require('telescope').load_extension('fzf')

-- " nnoremap <leader>w :lua require("telescope").extensions.git_worktree.git_worktrees()<cr>
vim.keymap.set('n', '<leader>w', require("telescope").extensions.git_worktree.git_worktrees, {})
-- " nnoremap <leader>nw :lua require("telescope").extensions.git_worktree.create_git_worktree()<cr>
vim.keymap.set('n', '<leader>nw', require("telescope").extensions.git_worktree.create_git_worktree, {})
