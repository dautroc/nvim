<h1 align="center">Sophia's Nvim config<br>
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

<div id="image-container" style="display: flex; justify-content: center; align-items: center;">
  <img src="https://previews.dropbox.com/p/thumb/AB5jAaSdQg92S433dGhc8O-Rxf8tKCrAUNsmWcnuZH1dKo_8QzHGTO0STNH5WUWGexLcbl5a28Ml7g2VfT0x0LahD80nShiUBfS4fhAhDepgal__i61b1llbELjOTv4O7DXK6GwCGI-o-8c0twhYFOATtJ5Yml1RRWugMpg9SmAxIanSm76mWyL6fs2nDZgzFcO0HDszSCpyU4uaPHj-RvbE2_fjEEKzUmzaDCw9EE9nUJNM8gIwukOuMSVrhql3d-UbjmXOyHg9Pa_53fC1VaEOJO5Zzn_xibi88VBnMNYimPAJQHYBXvtMDlgm9KBVqSqed2NyU1NBktfuD5aBJIgcJPpymRo5QRhxsrIF_5-uMnshuP_BT0HaBs-oxzEwNS0/p.jpeg">

  <img src="https://previews.dropbox.com/p/thumb/AB5UmKM4-LluYlhEiMDhVoUBxzrUjSvPvXxg1q7hCiWDpjz6yLOi9ixcEMT8pA7MJW3fami6PojJolYT_OjlcygHi5ldw54WGco-0FSlThzP9OJ5YninISCBd0bcnOi-hd9DbMFnkzrT0dJdJLAUNawyuJSiMuuiO91v9k7MtFnf6Q0yL-L8d_ffmBc_grhQES5HAi9a0FpDN1YKfQsTdCrZ7GApJ1Dix-gqfTc_2Q-CXk9LvEUp4KOhsuFQFI1NUjq-qMwC88au4grB05nj0Ro0BweO6pgzouOtPoUhRgJj_eUnwLu994r0o19luIP6M5IoonO6VJLbt5yA-zsR6GBBIfmpKES-0VGYBI_sBdFbmNE1_kmjPcOMfEUteO9qF-U/p.jpeg">

  <img src="https://previews.dropbox.com/p/thumb/AB4oNhvsa2Fh-G1JfelEEIZAfw9TT3idAfcqIxafJJdFvzH3bwgeZa8tf-D1WX4jnGtt3nkk675YlQR8u36YfaMXzNDD-7_zpY5_r6Gl0SMPkCaQxchifU2V5E3YrRjkXa__biFUxyn6XzgqEt6yl1AR6RBvH2Rt7hIO6HuOeVb16yLvqUnYkpenULeAviP4wpQNT9WCjYEjt_JLH5wg1hMV_o5AmSZj1KeY6x9GTUXAV5fDp0Q8MDidGig9paFivvQmoEuIhMq2VwETr0UhY_SaMluPCr7PA-JS5_wMsE6ZRQTcc7TRFNbXCUI6orQUk7isOKtLvRue3_xYZ3jEpUobJsBDc8-bQWMNJ49OqdvjeFr8yEOeFRkAbl74TBEZOZM/p.jpeg">
</div>

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
Please note that the structure may changes since I can add more plugins to server my work.
`~/.config/nvim`

```sh
nvim
 ├── init.lua
 ├── after
 │   └── ftplugin
 │   │   └── rb.lua
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

Note:
- **after/ftplugin**: directory in Neovim (and Vim) is a location where you can place filetype-specific configuration files that will be loaded after the default configuration for a given filetype.
- **init.lua**: main configuration here, first loaded when nvim start up
- **lua/**:
  - **core/**: nvim settings 
  - **plugins/**: all plugin files that lazynvim will load
  - **settings/**: lua settings for nvim for removing warning (optional)  
  - **utils/**: centralize servers, parser, linters
- **plugin/netrw.lua**: Better netrw
