return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  keys = {
    -- { "<leader>jt", "<cmd>ToggleTerm<cr>", desc = "Term toggle" },
    -- Term direction
    -- { "<leader>jv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Term vertical" },
    -- { "<leader>jx", "<cmd>ToggleTerm direction=horizontal size=20<cr>", desc = "Term horizontal" },
    -- { "<leader>jf", "<cmd>ToggleTerm direction=float<cr>", desc = "Term float" },

    -- Term actions
    -- { "<leader>jl", "<cmd>TermSelect<cr>", desc = "Term list" },
    -- { "<leader>js", "<cmd>ToggleTermSetName<cr>", desc = "Term set name" },
    -- { "<leader>jk", "<cmd>ToggleTermSendCurrentLine<cr>", desc = "Term execute" },
    -- { "<leader>jk", ":ToggleTermSendVisualSelection<cr>", desc = "Term execute", mode = "v" },
  },
  config = function()
    require("toggleterm").setup{
      size = 15,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 1,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'horizontal',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 3,
        highlights = {
          border = "Normal",
          background = "Normal",
        }
      },
      winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end
      },
    }
  end
}
