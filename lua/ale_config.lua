local u = require('utils')

u.g.ale_linters = {
 ruby =  {'rubocop'},
 rspec = {'rubocop'},
}

local _ale_fixer = {}
_ale_fixer['*'] = {'remove_trailing_lines', 'trim_whitespace'};
_ale_fixer['ruby'] = {'remove_trailing_lines', 'trim_whitespace', 'rubocop'};
_ale_fixer['rspec'] = {'remove_trailing_lines', 'trim_whitespace'};

u.g.ale_fixer = _ale_fixer
u.g.ale_disable_lsp = 1
u.g.ale_fix_on_save = 1

u.g.ale_lint_on_text_changed = 0
u.g.ale_lint_on_enter = 1
u.g.ale_lint_on_save = 0
u.g.ale_lint_on_insert_leave = 0

