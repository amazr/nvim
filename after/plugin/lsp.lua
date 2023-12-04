local lsp = require("lsp-zero")
local config = require("lspconfig")
local lspkind = require('lspkind')
require "lsp_signature".setup({})

require("lsp-format").setup {}
-- config.jdtls.setup { on_attach = require("lsp-format").on_attach }

lsp.preset("recommended")

lsp.ensure_installed({
	'lua_ls'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}


local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
})



cmp_mappings['<S-Tab>'] = nil

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
    }
})

local function attach (client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "<leader>vgd", function()
        vim.cmd("vsplit")
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    -- This is mapped in telescope
    -- vim.keymap.set("n", "<leader>rf", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    --vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

require('sg').setup {
    on_attach = attach
}

lsp.on_attach(attach)

lsp.skip_server_setup({'jdtls'})

lsp.setup()

cmp.setup({
    experimental = {
        ghost_text = true -- this feature conflict with copilot.vim's preview.
    },
    formatting = {
        fields = {'abbr', 'kind', 'menu'},
        format = require('lspkind').cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
            menu = {
                nvim_lsp = "[lsp]",
                cody = "[cody]",
                luasnip = "[snip]",
            },
        }),
        snippet = {
            expand = function(args)
                require'luasnip'.lsp_expand(args.body)
            end
        },
        sources = {
            { name = 'cody' },
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        }
    },
    sources = cmp.config.sources({
        { name = 'cody' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }),
})

vim.diagnostic.config({
    virtual_text = true
})

-- disable lsp log
vim.lsp.set_log_level("off")

