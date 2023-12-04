local builtin = require('telescope.builtin')

require('telescope').setup({
    defaults = {
        path_display = { 'truncate' },
        layout_config = {
            width = 0.99
        }
    },
    pickers = {
        git_files = {
        },
        grep_string = {
        },
        lsp_references = {
        },
        lsp_implementations = {
        },
        lsp_incoming_calls = {
        },
        lsp_outgoing_calls = {
        }
    },
    extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
      }
    }
  }
})

require("telescope").load_extension("ui-select")

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>", {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("grep > ") });
end)

-- Some extra LSP stuff
vim.keymap.set('n', '<leader>rf', function()
    builtin.lsp_references() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>gi', function()
    builtin.lsp_implementations() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ic', function()
    builtin.lsp_incoming_calls() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>oc', function()
    builtin.lsp_outgoing_calls() end, { noremap = true, silent = true })
