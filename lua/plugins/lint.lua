return {
	"mfussenegger/nvim-lint",
  config = function()
    require('lint').linters_by_ft = {
      markdown = {'vale'},
      ruby = {'rubocop', 'ruby'},
      typescriptreact = {'eslint_d'},
    }
  end
}
