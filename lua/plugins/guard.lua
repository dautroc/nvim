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
    ft("lua"):fmt("lsp"):append("stylua"):lint("luacheck")
    ft("json"):fmt("prettier")

    -- use lsp to format first then use rubocop format
    ft("ruby"):fmt("lsp"):append("rubocop"):lint("rubocop")
    ft("typescriptreact"):fmt("lsp"):append("prettier"):lint("eslint_d")
    ft("go"):fmt("lsp"):append("gofumt"):lint("golangci-lint")
    ft("python"):fmt("lsp"):append("black"):lint("flake8")

    require("guard").setup({
      fmt_on_save = false,
      lsp_as_default_formatter = true,
    })
  end,
}
