-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    -- packer - for managing packages
    use 'wbthomason/packer.nvim'

    -- telescope - for fuzzy finding
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'sourcegraph/sg.nvim',
        run = 'nvim -l build/init.lua',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- telescope ui select - for telescope selecting pop-ups (i.e code actions)
    use {'nvim-telescope/telescope-ui-select.nvim' }

    -- lualine - for statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- fidget - for displaying LSP status
    use {
        'j-hui/fidget.nvim'
    }

    -- rose-pine - colorscheme2
    -- use({ 'rose-pine/neovim', as = 'rose-pine' })
    -- catppuccin
    use { "catppuccin/nvim", as = "catppuccin" }

    -- treesitter - for text -> tree parsing, useful for colorschemes
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- treesitter context -> for scoped context
    use "nvim-treesitter/nvim-treesitter-context"

    -- treesitter textobjects -> for selecting text objects
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })

    -- TSPlayground - for looking at the parse tree
    use('nvim-treesitter/playground')

    -- harpoon - for quick file jumping
    use('theprimeagen/harpoon')

    -- undotree - for complicated undo actions
    use('mbbill/undotree')

    -- fugitive - for managing git
    use('tpope/vim-fugitive')

    -- lsp-zero - for managing lsp's
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use { 'saadparwaiz1/cmp_luasnip' }

    -- nvim jdtls -> for java lsp support
    use ('mfussenegger/nvim-jdtls')

    -- lspkind -> for lsp cmp icons
    use ('onsails/lspkind.nvim')

    -- toggleterm - for a floating terminal in nvim
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}

    -- k9s - for a k9s wrapper
    -- use ('hsalem7/nvim-k8s')

    -- dap stuff
    use { 'theHamsta/nvim-dap-virtual-text' }
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- glow -> for markdown previewing
    -- use ('ellisonleao/glow.nvim')

    -- tmux
    use {
        "aserowy/tmux.nvim"
    }

    -- slides
    --use {
    --    "Chaitanyabsprip/present.nvim"
    --}

    -- copilot -> to appease the AI overlords
    -- use { 'github/copilot.vim' }

    -- use { "zbirenbaum/copilot.lua" }
    use {
        "ray-x/lsp_signature.nvim",
    }

    use {
        'jinh0/eyeliner.nvim'
    }

    use {
        "lukas-reineke/lsp-format.nvim"
    }
end)
