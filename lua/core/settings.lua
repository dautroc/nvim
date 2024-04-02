# Setup nvim as git editor
if vim.fn.has('nvim') and vim.fn.executable('nvr') then
    vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end

