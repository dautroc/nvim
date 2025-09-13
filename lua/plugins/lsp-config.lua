return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.pyright.setup{}
    lspconfig.ts_ls.setup{}
    lspconfig.lua_ls.setup{}
    lspconfig.ruby_lsp.setup{}
  end,
  keys = {
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "LSP Format" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "LSP Rename" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Actions" },
    { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Documentation" },
  },
}
