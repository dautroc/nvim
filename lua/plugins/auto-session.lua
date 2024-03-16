return {
  'rmagatti/auto-session',
  enabled = true,
  keys = {
    {
      "<leader>sr",
      "<cmd>SessionRestore<CR>",
      desc = "Restore last session",
    },
    {
      "<leader>sl",
      "<cmd>lua require('auto-session.session-lens').search_session()<CR>",
      desc = "List session",
    },
    {
      "<leader>ss",
      "<cmd>SessionSave<CR>",
      desc = "Save session",
    }
  },
  config = function()
    require("auto-session").setup {
      log_level = vim.log.levels.ERROR,
      auto_restore_enabled = false,
      auto_session_use_git_branch = false,
      auto_session_enable_last_session = false,
      auto_session_suppress_dirs = { "~/workspace" },

      session_lens = {
        buftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    }
  end
}
