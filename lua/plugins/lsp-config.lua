return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Configure individual LSP servers using vim.lsp.config (Neovim 0.11+)
    vim.lsp.config.pyright = {
      cmd = { "pyright-langserver", "--stdio" },
      filetypes = { "python" },
      root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
      single_file_support = true,
    }

    vim.lsp.config.ts_ls = {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
      root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
      single_file_support = true,
    }

    vim.lsp.config.lua_ls = {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
      single_file_support = true,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT"
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library"
            }
          }
        }
      }
    }

    vim.lsp.config.ruby_lsp = {
      cmd = { "ruby-lsp" },
      filetypes = { "ruby" },
      root_markers = { "Gemfile", "Rakefile", ".git" },
      single_file_support = true,
    }

    vim.lsp.config.copilot = {
      cmd = { "copilot-language-server", "--stdio" },
      filetypes = { "python", "javascript", "typescript", "lua", "ruby", "go", "rust", "java", "c", "cpp", "html", "css", "json", "yaml" },
      root_markers = { ".git" },
      single_file_support = true,
    }

    -- Setup default LSP keymaps and autocommands
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf

        -- Enable completion triggered by <c-x><c-o>
        vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- LSP Navigation keymaps
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Navigation (gd, gD, gr, gi, gt are handled by snacks.nvim picker)
        -- Uncomment these if you prefer default LSP functions over snacks picker:
        -- map('n', 'gd', vim.lsp.buf.definition, "Go to definition")
        -- map('n', 'gD', vim.lsp.buf.declaration, "Go to declaration")
        -- map('n', 'gr', vim.lsp.buf.references, "Find references")
        -- map('n', 'gi', vim.lsp.buf.implementation, "Go to implementation")
        -- map('n', 'gt', vim.lsp.buf.type_definition, "Go to type definition")

        -- Documentation
        map('n', 'K', vim.lsp.buf.hover, "Show hover documentation")
        -- map('n', '<C-k>', vim.lsp.buf.signature_help, "Signature help")

        -- Diagnostics
        -- map('n', '[d', vim.diagnostic.goto_prev, "Previous diagnostic")
        -- map('n', ']d', vim.diagnostic.goto_next, "Next diagnostic")
        -- map('n', '<leader>ld', vim.diagnostic.open_float, "Show diagnostic popup")
        -- map('n', '<leader>lq', vim.diagnostic.setloclist, "Populate location list")

        -- Note: <leader>ls and <leader>lS are handled by snacks.nvim picker

        -- Enable inlay hints if supported
        if client and client.supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          map('n', '<leader>lI', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
          end, "Toggle inlay hints")
        end
      end,
    })

    -- Configure diagnostics display
    vim.diagnostic.config({
      virtual_text = {
        prefix = '●',
        source = true,
      },
      float = {
        source = true,
        border = 'rounded',
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- Define diagnostic signs
    local signs = {
      Error = "󰅚 ",
      Warn = "󰀪 ",
      Hint = "󰌶 ",
      Info = " ",
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
  keys = {
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
    { "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, desc = "LSP Format" },
    { "<leader>lr", vim.lsp.buf.rename, desc = "LSP Rename" },
    { "<leader>la", vim.lsp.buf.code_action, desc = "Code Actions" },
    { "<leader>lo", vim.lsp.buf.document_symbol, desc = "Document symbols" },
  },
}
