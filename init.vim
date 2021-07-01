filetype off
call plug#begin('~/.vim/plugged')
Plug 'Xuyuanp/scrollbar.nvim'
Plug 'mhinz/vim-startify'
Plug 'moll/vim-bbye'
Plug 'preservim/vimux'
Plug 'vim-test/vim-test'
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'ntpeters/vim-better-whitespace'
Plug 'flazz/vim-colorschemes'
Plug 'windwp/nvim-autopairs'
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

" nnoremap tn  :tabnew<CR>
" nnoremap th  :tabfirst<CR>
" nnoremap tl  :tablast<CR>
" nnoremap tj  :tabprev<CR>
" nnoremap tk  :tabnext<CR>
" nnoremap tt  :tabclose<CR>

" Language provider
let g:ruby_host_prog = '~/.rbenv/versions/2.6.6/lib/ruby/gems/2.6.0/gems/neovim-0.8.1/exe/neovim-ruby-host'

if has("autocmd")
  autocmd FileType jsonnet set tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType lua set tabstop=2 shiftwidth=2 softtabstop=2
  autocmd BufEnter * autocmd! matchparen
endif

colorscheme deep-space
let mapleader=','
:imap jj <Esc>

"========================================================
" SCROLL BAR
"========================================================
augroup ScrollbarInit
  autocmd!
  autocmd CursorMoved,VimResized,QuitPre              * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained                        * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost     * silent! lua require('scrollbar').clear()
augroup end

"========================================================
" VIM TEST
"========================================================
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let g:VimuxUseNearest = 0
let g:test#strategy = 'vimux'
let test#ruby#rspec#executable = 'bundle exec rspec'

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
require('treesister_config')
require('autopairs_config')
EOF

"========================================================
" WHICH KEY
"========================================================

"========================================================
" TELESCOPE
"========================================================
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').oldfiles()<cr>

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

function! StarifyGitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! StarifyGitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction
let g:startify_lists = [
      \ { 'type': 'dir',                           'header': ['   MRU '. getcwd()] },
      \ { 'type': function('StarifyGitModified'),  'header': ['   Git modified']},
      \ { 'type': function('StarifyGitUntracked'), 'header': ['   Git untracked']},
      \ ]
