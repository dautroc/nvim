return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Ruby on Rails (ERB)
        null_ls.builtins.formatting.erb_format,
        null_ls.builtins.diagnostics.erb_lint,

        -- Go
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.completion.tags,

        -- TypeScript React
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.completion.tags,

        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.completion.tags,

        -- Lua
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.completion.tags,

        -- Hover (dictionary for text/markdown/org)
        null_ls.builtins.hover.dictionary,
      },
    })
  end,
}
