return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      mux = {
        backend = "zellij",
        enabled = true,
      },
      tools = {
        kilocode = {
          cmd = { "kilocode" },
        },
      }
    },
  },
  keys = {
    {
      "<tab>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>" -- fallback to normal tab
        end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<c-.>",
      function()
        require("sidekick.cli").focus()
      end,
      desc = "Sidekick Switch Focus",
      mode = { "n", "v" },
    },
    {
      "<leader>ia",
      function()
        require("sidekick.cli").toggle({ focus = true })
      end,
      desc = "Toggle CLI",
      mode = { "n", "v" },
    },
    {
      "<leader>ip",
      function()
        require("sidekick.cli").select_prompt()
      end,
      desc = "Prompt",
      mode = { "n", "v" },
    },
    {
      "<leader>iv",
      function() require("sidekick.cli").send({ msg = "{selection}" }) end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>is",
      function() require("sidekick.cli").select() end,
      desc = "Select CLI",
    },
    {
      "<leader>id",
      function() require("sidekick.cli").close() end,
      desc = "Detach a CLI Session",
    },
    {
      "<leader>it",
      function() require("sidekick.cli").send({ msg = "{this}" }) end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>if",
      function() require("sidekick.cli").send({ msg = "{file}" }) end,
      desc = "Send File",
    },
  },
}
