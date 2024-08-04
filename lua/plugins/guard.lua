return {
  "nvimdev/guard.nvim",
  dependencies = {
    "nvimdev/guard-collection",
  },
  keys = {
    { "gq", "<cmd>GuardFmt<cr>", desc = "Format code" },
  },
  config = function()
    local ft = require("guard.filetype")
    -- use stylua to format lua files and no linter
    ft("lua"):fmt("stylua")
    ft("json"):fmt("prettier")

    -- use lsp to format first then use rubocop format
    ft("ruby"):fmt("lsp"):append("rubocop"):lint("rubocop")
    ft("typescriptreact"):lint("eslint_d")

    require("guard").setup({
      fmt_on_save = false,
      lsp_as_default_formatter = true,
    })
  end,
}
