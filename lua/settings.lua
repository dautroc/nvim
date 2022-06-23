local u = require('utils')

u.opt.termguicolors = true
u.cmd 'colorscheme deep-space'
u.opt.number = true
u.opt.linespace = 1
u.opt.smartcase = true
u.opt.updatetime = 100
u.opt.ignorecase = true
u.opt.splitbelow = true
u.opt.splitright = true
u.opt.lazyredraw = true
u.opt.encoding = 'utf-8'
u.opt.signcolumn = 'yes'
u.opt.relativenumber = true
u.opt.clipboard = 'unnamedplus'
u.opt.completeopt = "menu,menuone,noinsert"
u.opt.wrap = false
u.g.ruby_host_prog = '~/.rbenv/versions/3.1.2/bin/neovim-ruby-host'

-- TAB STOP
u.opt.tabstop = 2
u.opt.softtabstop = 2
u.opt.shiftwidth = 2

-------------------- INDENT LINE -----------------------------------
u.g.indentLine_enabled = 0

-------------------- BETTER WHITE SPACE ------------------------------
u.g.better_whitespace_enabled = 1
u.g.strip_whitespace_on_save = 1
u.g.strip_whitespace_confirm = 0
