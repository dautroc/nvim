local u = require('utils')

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
u.opt.termguicolors = true
u.opt.relativenumber = true
u.opt.clipboard = 'unnamedplus'
u.opt.completeopt = "menu,menuone,noinsert"
u.opt.wrap = false

-- Set tabstop
u.opt.tabstop = 2
u.opt.softtabstop = 2
u.opt.shiftwidth = 2

u.g.ruby_host_prog = '~/.rbenv/versions/3.1.2/bin/neovim-ruby-host'
