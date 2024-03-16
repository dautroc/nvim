return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      prompts = {
        ReviewCode = {
          prompt = "/COPILOT_REVIEW Please review the following code and provide suggestions for improvement."
        },
        BetterNamings = {
          prompt = "Please provide better names for the following variables and functions.",
        },
        SwaggerApiDocs = {
          prompt = "Please provide documentation for the following API using Swagger.",
        },
        SwaggerJsDocs = {
          prompt = "Please write JSDoc for the following API using Swagger.",
        },
        TextWording = {
          prompt = "Please improve the grammar and wording of the following text.",
        },
        TextConcise = {
          prompt = "Please rewrite the following text to make it more concise.",
        },
      },
      mappings = {
        close = 'q',
        reset = '<C-r>',
        complete = '<Tab>',
        submit_prompt = '<CR>',
        accept_diff = '<C-y>',
        show_diff = '<C-d>',
      },
    },
    keys = {
      {
        "<leader>ho",
        function()
          require("CopilotChat").open()
        end,
        desc = "CopilotChat - Open",
      },
      {
        "<leader>hq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
      {
        "<leader>hp",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
    },
  },
}
