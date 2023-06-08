<h1 align="center">Nvim config<br> For Web Development (Rails)
<br>
<a href="https://www.lua.org/">
<img
    alt="Lua"
    src="https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white">
</a>
<a href="https://github.com/neovim/neovim">
<img
    alt="Neovim"
    src="https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white">
</a>
</h1>

## About
This nvim configuration is built for web development (mostly part for Rails project).

## Setup

First you need have your nvim version at least 0.9.1. Follow [nvim instruction](https://neovim.io/)

## Config Dependencies
- node >= 18
- npm >= 9
- gcc
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [Nerd Fonts](https://www.nerdfonts.com/) - An easy tool to install ([getnf](https://github.com/ronniedroid/getnf))


## Install the config

Make sure to remove or move your current `nvim` directory

Backup your config 
```sh
mv ~/.config/nvim/ ~/.config/nvim-bak/
```

Clone this nvim config
```sh
git clone https://github.com/dautroc/nvim.git ~/.config/nvim
```

## Structure
`~/.config/nvim`

```sh
nvim
 ├── after
 │   └── ftplugin
 │       ├── ruby.lua
 ├── init.lua
 ├── lua
 │   ├── core
 │   │   ├── autocommands.lua
 │   │   ├── keymaps.lua
 │   │   └── options.lua
 │   ├── lazy-setup.lua
 │   ├── plugins
 │   │   ├── autopairs.lua
 │   │   ├── autotag.lua
 │   │   ├── cmp.lua
 │   │   ├── colorizer.lua
 │   │   ├── comment.lua
 │   │   ├── copilot.lua
 │   │   ├── devicons.lua
 │   │   ├── dressing.lua
 │   │   ├── fugitive.lua
 │   │   ├── gitsigns.lua
 │   │   ├── indentline.lua
 │   │   ├── lsp.lua
 │   │   ├── lualine.lua
 │   │   ├── markdown-preview.lua
 │   │   ├── mason.lua
 │   │   ├── null-ls.lua
 │   │   ├── nvimtree.lua
 │   │   ├── rosepine.lua
 │   │   ├── telescope.lua
 │   │   ├── toggleterm.lua
 │   │   └── treesitter.lua
 │   ├── settings
 │   │   ├── lua_ls.lua
 │   └── utils
 │       └── init.lua
 ├── plugin
 │   └── netrw.lua
 └── README.md
```
