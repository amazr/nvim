local auto_theme_custom = require('lualine.themes.auto')
auto_theme_custom.normal.c.bg = 'none'
auto_theme_custom.insert.c.bg = 'none'
auto_theme_custom.visual.c.bg = 'none'
auto_theme_custom.replace.c.bg = 'none'

require('lualine').setup({
    disabled_filetypes = {},
    options = {
        theme = auto_theme_custom,
    },
    sections = {
        lualine_b = { 'branch' },
        lualine_c = {
            function()
                local fn = vim.fn.expand('%:~:.')
                if vim.startswith(fn, "jdt://") then
                    fn = string.sub(fn, 0, string.find(fn, "?") - 1)
                end
                return fn
            end
        },
        lualine_x = { },
        lualine_y = {
            function()
                local search = vim.fn.searchcount({ maxcount = 0 })
                if search.total ~= 0 then
                    return vim.fn.getreg("/") .. " [" .. search.current .. "/" .. search.total .. "]"
                end
                return ""
            end
        }
    }
})
