local function parseModuleName(path)
    return path:match("([^\\/]+)")
end

local function parseFileName(path)
    return path:match("^(.*)%..*")
end

vim.keymap.set("n", "<leader>gwtm", function()
    local word = vim.call('expand','<cword>')
    local module = parseModuleName(vim.fn.expand("%s"))
    local file = parseFileName(vim.fn.expand("%:t"))
    vim.cmd("vsplit | terminal")
    vim.cmd("setlocal norelativenumber nonumber")
    local command = ':call jobsend(b:terminal_job_id, "gwtm '..module..' '..file..' '..word..'\\n")'
    vim.cmd(command)
end)

vim.keymap.set("n", "<leader>gwtc", function ()
    local module = parseModuleName(vim.fn.expand("%s"))
    local file = parseFileName(vim.fn.expand("%:t"))
    vim.cmd("vsplit | terminal")
    vim.cmd("setlocal norelativenumber nonumber")
    local command = ':call jobsend(b:terminal_job_id, "gwtc '..module..' '..file..'\\n")'
    vim.cmd(command)
end)

vim.keymap.set("n", "<leader>gwc", function ()
    vim.cmd("vsplit | terminal")
    vim.cmd("setlocal norelativenumber nonumber")
    local command = ':call jobsend(b:terminal_job_id, "gwc\\n")'
    vim.cmd(command)
end)

vim.keymap.set("n", "<leader>gws", function ()
    vim.cmd("vsplit | terminal")
    vim.cmd("setlocal norelativenumber nonumber")
    local command = ':call jobsend(b:terminal_job_id, "gws\\n")'
    vim.cmd(command)
end)
