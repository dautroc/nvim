return {
  "voldikss/vim-floaterm",
  config = function()
    -- Floaterm options
    vim.g.floaterm_shell = vim.o.shell
    vim.g.floaterm_title = "floaterm: $1/$2"
    vim.g.floaterm_wintype = "float"
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_position = "center"
    vim.g.floaterm_borderchars = "─│─│┌┐┘└"
    vim.g.floaterm_autoclose = 0
    vim.g.floaterm_autohide = 0
    vim.g.floaterm_autoinsert = true
    vim.g.floaterm_titleposition = "left"

    -- Smart toggle function
    local function smart_toggle_terminal(name, options)
      options = options or ""

      -- Check if terminal with this name exists
      local terminals = vim.fn["floaterm#buflist#gather"]()
      local terminal_exists = false
      local terminal_bufnr = nil

      for _, bufnr in ipairs(terminals) do
        local term_name = vim.fn.getbufvar(bufnr, "floaterm_name")
        if term_name == name then
          terminal_exists = true
          terminal_bufnr = bufnr
          break
        end
      end

      if terminal_exists then
        -- Terminal exists, toggle to it
        vim.cmd("FloatermToggle " .. name)
      else
        -- Terminal doesn't exist, create new one with name
        vim.cmd("FloatermNew --name=" .. name .. " " .. options)
      end
    end

    -- Smart send function - sends to last opened terminal or creates one
    local function smart_send_to_terminal()
      local terminals = vim.fn["floaterm#buflist#gather"]()
      if #terminals == 0 then
        -- No terminals exist, create a new one
        vim.cmd("FloatermNew")
        vim.defer_fn(function()
          vim.cmd("FloatermSend")
        end, 100)
      else
        -- Send to existing terminal
        vim.cmd("FloatermSend")
      end
    end


    -- Make function globally available
    _G.smart_toggle_terminal = smart_toggle_terminal
    _G.smart_send_to_terminal = smart_send_to_terminal

    -- Smart toggle keymaps
    vim.keymap.set("n", "<A-s>", function() smart_toggle_terminal("split", "--wintype=split --height=0.3") end, { silent = true, desc = "Smart toggle split terminal" })
    vim.keymap.set("n", "<A-v>", function() smart_toggle_terminal("vsplit", "--wintype=vsplit --width=0.5") end, { silent = true, desc = "Smart toggle vsplit terminal" })
    vim.keymap.set("n", "<A-f>", function() smart_toggle_terminal("float", "--wintype=float --width=0.8 --height=0.8") end, { silent = true, desc = "Smart toggle float terminal" })

    -- Original keymaps (normal mode)
    vim.keymap.set("n", "<A-k>", ":FloatermPrev<CR>", { silent = true, desc = "Floaterm Prev" })
    vim.keymap.set("n", "<A-j>", ":FloatermNext<CR>", { silent = true, desc = "Floaterm Next" })
    vim.keymap.set("n", "<A-t>", ":FloatermToggle<CR>", { silent = true, desc = "Floaterm Toggle" })

    -- Improved send keymaps
    vim.keymap.set("n", "<A-e>", smart_send_to_terminal, { silent = true, desc = "Send current line to floaterm" })
    vim.keymap.set("v", "<A-e>", smart_send_to_terminal, { silent = true, desc = "Send selection to floaterm" })

    -- Terminal mode keymaps
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "floaterm",
      callback = function()
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], { buffer = true })

        -- Window navigation
        vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { buffer = true, silent = true, desc = "Move to left window" })
        vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { buffer = true, silent = true, desc = "Move to bottom window" })
        vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { buffer = true, silent = true, desc = "Move to top window" })
        vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { buffer = true, silent = true, desc = "Move to right window" })

        -- Smart toggle in terminal mode
        vim.keymap.set("t", "<A-s>", [[<C-\><C-n>:lua smart_toggle_terminal("split", "--wintype=split --height=0.3")<CR>]], { buffer = true, silent = true, desc = "Smart toggle split terminal" })
        vim.keymap.set("t", "<A-v>", [[<C-\><C-n>:lua smart_toggle_terminal("vsplit", "--wintype=vsplit --width=0.3")<CR>]], { buffer = true, silent = true, desc = "Smart toggle vsplit terminal" })
        vim.keymap.set("t", "<A-f>", [[<C-\><C-n>:lua smart_toggle_terminal("float", "--wintype=float --width=0.8 --height=0.8")<CR>]], { buffer = true, silent = true, desc = "Smart toggle float terminal" })

        -- Original terminal mode keymaps
        vim.keymap.set("t", "<A-k>", "<C-\\><C-n>:FloatermPrev<CR>", { buffer = true, silent = true, desc = "Floaterm Prev" })
        vim.keymap.set("t", "<A-j>", "<C-\\><C-n>:FloatermNext<CR>", { buffer = true, silent = true, desc = "Floaterm Next" })
        vim.keymap.set("t", "<A-t>", "<C-\\><C-n>:FloatermToggle<CR>", { buffer = true, silent = true, desc = "Floaterm Toggle" })
        vim.keymap.set("t", "<A-d>", "<C-\\><C-n>:FloatermKill<CR>", { buffer = true, silent = true, desc = "Floaterm Kill" })
      end,
    })
  end,
}
