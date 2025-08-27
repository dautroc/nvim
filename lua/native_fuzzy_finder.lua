if vim.fn.executable "rg" == 1 then
    function _G.RgFindFiles(cmdarg, _cmdcomplete)
        local fnames = vim.fn.systemlist('rg --files --hidden --color=never --glob="!.git"')
        if #cmdarg == 0 then
            return fnames
        else
            return vim.fn.matchfuzzy(fnames, cmdarg)
        end
    end

    vim.o.findfunc = 'v:lua.RgFindFiles'
end

local function is_cmdline_type_find()
    local cmdline_cmd = vim.fn.split(vim.fn.getcmdline(), ' ')[1]

    return cmdline_cmd == 'find' or cmdline_cmd == 'fin'
end

vim.api.nvim_create_autocmd({ 'CmdlineChanged', 'CmdlineLeave' }, {
    pattern = { '*' },
    group = vim.api.nvim_create_augroup('CmdlineAutocompletion', { clear = true }),
    callback = function(ev)
        local function should_enable_autocomplete()
            local cmdline_cmd = vim.fn.split(vim.fn.getcmdline(), ' ')[1]

            return is_cmdline_type_find() or cmdline_cmd == 'help' or cmdline_cmd == 'h'
        end

        if ev.event == 'CmdlineChanged' and should_enable_autocomplete() then
            vim.opt.wildmode = 'noselect:lastused,full'
            vim.fn.wildtrigger()
        end

        if ev.event == 'CmdlineLeave' then
            vim.opt.wildmode = 'full'
        end
    end
})

vim.keymap.set('n', '<leader>F', ':find<space>', { desc = 'Fuzzy find' })

vim.keymap.set('c', '<m-e>', '<home><s-right><c-w>edit<end>', { desc = 'Change command to :edit' })
vim.keymap.set('c', '<m-d>', function()
    if not is_cmdline_type_find() then
        vim.notify('This binding should be used with :find', vim.log.levels.ERROR)
        return
    end

    local cmdline_arg = vim.fn.split(vim.fn.getcmdline(), ' ')[2]

    if vim.uv.fs_realpath(vim.fn.expand(cmdline_arg)) == nil then
        vim.notify('The second argument should be a valid path', vim.log.levels.ERROR)
        return
    end

    local keys = vim.api.nvim_replace_termcodes(
        '<C-U>edit ' .. vim.fs.dirname(cmdline_arg),
        true,
        true,
        true
    )
    vim.fn.feedkeys(keys, 'c')
end, { desc = 'Edit the dir for the path' })

vim.keymap.set('c', '<c-v>', '<home><s-right><c-w>vs<end>', { desc = 'Change command to :vs' })
vim.keymap.set('c', '<c-s>', '<home><s-right><c-w>sp<end>', { desc = 'Change command to :sp' })
vim.keymap.set('c', '<c-t>', '<home><s-right><c-w>tabe<end>', { desc = 'Change command to :tabe' })
