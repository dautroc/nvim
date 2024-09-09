return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
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
        complete = {
          insert ='<Tab>',
        },
        close = {
          normal = 'q',
          insert = '<C-c>'
        },
        reset = {
          normal ='<C-r>',
          insert = '<C-r>'
        },
        submit_prompt = {
          normal = '<CR>',
          insert = '<C-m>'
        },
        accept_diff = {
          normal = '<C-y>',
          insert = '<C-y>'
        },
        show_diff = {
          normal = 'gd'
        },
        show_system_prompt = {
          normal = 'gp'
        },
        show_user_selection = {
          normal = 'gs'
        }
      },
    },
    keys = {
      {
        "<leader>ho",
        function()
          require("CopilotChat").open()
        end,
        desc = "Open chat",
      },
      {
        "<leader>hq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "Quick chat",
      },
      {
        "<leader>hp",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "Prompt actions",
      },
    },
  },
}
