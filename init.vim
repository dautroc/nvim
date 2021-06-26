filetype off
call plug#begin('~/.vim/plugged')
Plug 'sindrets/diffview.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/git-time-lapse'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'mhinz/vim-signify'
Plug 'eugen0329/vim-esearch'
Plug 'yegappan/mru'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-startify'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ojroques/nvim-lspfuzzy'
call plug#end()

"========================================================
" EDITOR CONFIGS
"========================================================
" True color
if (has("termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

nnoremap <nowait><silent> <C-C> :noh<CR>
nnoremap <silent>qq :q<CR>
set clipboard=unnamedplus
set completeopt=menuone,noselect " Prerequisite for compe
set ignorecase
set laststatus=2
set lazyredraw
set linespace=1
set nobackup
set nofoldenable
set nosmd
set nowritebackup
set number
set shortmess+=c
set signcolumn=yes
set smartcase
set splitbelow
set splitright
set timeoutlen=1000 ttimeoutlen=0
set ttyfast
set updatetime=300
set encoding=utf-8

nnoremap tn  :tabnew<CR>
nnoremap th  :tabfirst<CR>
nnoremap tl  :tablast<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tt  :tabclose<CR>

if has("autocmd")
  autocmd FileType jsonnet set tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType lua set tabstop=2 shiftwidth=2 softtabstop=2
  autocmd BufEnter * autocmd! matchparen
endif

colorscheme deep-space
let mapleader=','
:imap jj <Esc>

" Config language provider
let g:ruby_host_prog = '~/.rbenv/versions/2.6.6/lib/ruby/gems/2.6.0/gems/neovim-0.8.1/exe/neovim-ruby-host'

"========================================================
" LUA CONFIGS
"========================================================
lua <<EOF
require('eviline')
require('lspconfig_config')
require('compe_config')
require('nvimtree_config')
require('telescope_config')
require('diffview_config')
require('lspfuzzy').setup {}
EOF

"========================================================
" TELESCOPE
"========================================================
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"========================================================
" DIFF VIEW
"========================================================
nnoremap <leader>dv :DiffviewOpen<CR>

"========================================================
" NVIM-TREE
"========================================================
nnoremap <leader>v :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_gitignore = 1
let g:nvim_tree_disable_window_picker = 1
let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ]
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"========================================================
" ALE
"========================================================
let g:ale_linter_aliases = {'rspec': ['ruby']}
let g:ale_linters = {
\ 'ruby': ['rubocop'],
\ 'rspec': ['rubocop'],
\}
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'ruby': ['remove_trailing_lines', 'trim_whitespace', 'rubocop'],
\ 'rspec': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_disable_lsp = 1
let g:ale_fix_on_save = 0

"========================================================
" VIM ESEARCH
"========================================================
let g:esearch = {}
let g:esearch.default_mappings = 0
let g:esearch.name = '[esearch]'
let g:esearch.regex   = 1
let g:esearch.textobj = 0
let g:esearch.case    = 'smart'

function! EsearchFloatingWindow()
  let height = float2nr((&lines - 2) * 0.9) " lightline + status
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.9)
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  setlocal buftype=nofile
endfunction
let g:esearch.win_new = {esearch -> EsearchFloatingWindow()}
autocmd User esearch_win_config autocmd BufLeave <buffer> quit

let g:esearch.win_map = [
 \ ['n', 'x',   '<plug>(esearch-win-split:reuse:stay):q!<cr>'],
 \ ['n', 'v',   '<plug>(esearch-win-vsplit:reuse:stay):q!<cr>'],
 \ ['n', '{',   '<plug>(esearch-win-jump:filename:up)'],
 \ ['n', '}',   '<plug>(esearch-win-jump:filename:down)'],
 \ ['n', 'j',   '<plug>(esearch-win-jump:entry:down)'],
 \ ['n', 'k',   '<plug>(esearch-win-jump:entry:up)'],
 \ ['n', 'r',   '<plug>(esearch-win-reload)'],
 \ ['n', '<cr>', '<plug>(esearch-win-open)'],
 \ ['n', '<esc>', ':q!<cr>']
 \]
nmap <silent> <leader>es <plug>(esearch)

highlight link esearchLineNr Comment
highlight link esearchCursorLineNr esearchFilename
"========================================================
" SIGNIFY
"========================================================
let g:signify_vcs_list = ['git']
let g:signify_sign_show_count = 0
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = '·'
let g:signify_sign_changedelete      = g:signify_sign_change
highlight SignifySignAdd guibg=255
highlight SignifySignDelete guibg=255
highlight SignifySignChange guibg=255
"========================================================
" FZF
"========================================================
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
let $FZF_DEFAULT_OPTS='--layout=reverse'

" Default all to a floating window
let g:fzf_layout = { 'window': 'call FzfFloatingWindow()' }
function! FzfFloatingWindow()
  let height = float2nr((&lines - 2) * 0.9) " lightline + status
  let row = float2nr((&lines - height) / 2)
  let width = float2nr(&columns * 0.9)
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  "Set Floating Window Highlighting
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

" Search recent files
function! FilterOldfiles(path_prefix) abort
  let path_prefix = '\V'. escape(a:path_prefix, '\')
  let counter     = 30
  let entries     = {}
  let oldfiles    = []

  for fname in MruGetFiles()
    if counter <= 0
      break
    endif

    let absolute_path = resolve(fname)
    " filter duplicates, bookmarks and entries from the skiplist
    if has_key(entries, absolute_path)
          \ || !filereadable(absolute_path)
          \ || match(absolute_path, path_prefix)
      continue
    endif
    let relative_path = fnamemodify(absolute_path, ":~:.")

    let entries[absolute_path]  = 1
    let counter                -= 1
    let oldfiles += [relative_path]
  endfor

  return oldfiles
endfunction

function! FzfRecentFiles()
  return fzf#run(fzf#wrap({
        \ 'source': FilterOldfiles(getcwd()),
        \ 'options': [
        \ '-m', '--header-lines', !empty(expand('%')),
        \ '--prompt', 'Recent files> ',
        \ "--preview", "bat {} --color=always --style=plain",
        \ '--preview-window', 'down:50%'
        \ ]}))
endfunction
noremap <silent> <c-h> <ESC>:call FzfRecentFiles()<CR>

" Search files
let g:fzf_preview_source=" --preview='bat {} --color=always --style=plain' --preview-window down:50%"
noremap <silent> <c-p> <ESC>:call fzf#vim#files('.', {'options': g:fzf_preview_source})<CR>

" Search files in specified rails folder
noremap <silent>rc <ESC>:call fzf#vim#files('./app/controllers/', {'options': g:fzf_preview_source})<CR>
noremap <silent>ra <ESC>:call fzf#vim#files('./app/api/', {'options': g:fzf_preview_source})<CR>
noremap <silent>rs <ESC>:call fzf#vim#files('./spec/', {'options': g:fzf_preview_source})<CR>
noremap <silent>rm <ESC>:call fzf#vim#files('./app/models/', {'options': g:fzf_preview_source})<CR>

" A backup searcher for esearch
let g:fzf_preview_window = ['down:50%', 'ctrl-/']
noremap <leader>ag <ESC>:Rg<space>
"========================================================
" EASYMOTION
"========================================================
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap <silent> <tab> <Plug>(easymotion-bd-w)
"========================================================
" GIT
"========================================================
nnoremap <silent> <leader>gt :call TimeLapse() <cr>
nnoremap <silent> <leader>gb :Git blame<cr>

"========================================================
" MISC
"========================================================
let g:indentLine_enabled = 0
let g:tmux_navigator_no_mappings = 1
let g:move_key_modifier = 'C'
let g:jsx_ext_required = 0

map <silent> <leader>urt <ESC>:call URT()<CR>
nnoremap \ ,
map <silent> <leader>' cs'"
map <silent> <leader>" cs"'
map <silent> <leader>hi :History<CR>
map <silent> <leader>u :UndotreeToggle<CR>
map <silent> <leader>pp :let @+=@%<CR>

" Switch window
map <silent> <space>h <C-W>h
map <silent> <space>j <C-W>j
map <silent> <space>k <C-W>k
map <silent> <space>l <C-W>l

" Traverse buffer
map <silent> <leader><leader> <C-^><CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

"========================================================
" STARTIFY
"========================================================
let g:startify_change_to_dir = 0
let g:startify_session_dir = '~/.vim/session'
let g:startify_session_persistence = 1
let g:startify_session_number = 3
let g:startify_session_sort = 1

function! GetUniqueSessionName()
  let path = fnamemodify(getcwd(), ':~:t')
  let path = empty(path) ? 'no-project' : path
  let branch = system('git branch --no-color --show-current 2>/dev/null')
  let branch = empty(branch) ? '' : '-' . branch
  return substitute(path . branch, '/', '-', 'g')
endfunction
" Don't forget to create ~/.vim/session, or vim requires an extra enter when exit
autocmd VimLeavePre * silent execute 'SSave! ' . GetUniqueSessionName()

function! StarifyGitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! StarifyGitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction
let g:startify_lists = [
      \ { 'type': 'sessions',                      'header': ['   Sessions']       },
      \ { 'type': 'dir',                           'header': ['   MRU '. getcwd()] },
      \ { 'type': function('StarifyGitModified'),  'header': ['   Git modified']},
      \ { 'type': function('StarifyGitUntracked'), 'header': ['   Git untracked']},
      \ ]
