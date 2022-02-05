local M = {}

function M.PluginList()
    return {
        -- LSP
        'wbthomason/packer.nvim',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        {
            'hrsh7th/nvim-cmp',
            requires = { 'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer', 'onsails/lspkind-nvim' },
            config = function() require 'lsp-config' end
        },

        -- treesitter
        {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function() require'nvim-treesitter.configs'.setup { highlight = { enable = true } } end
        },

        -- UI
        {
            'lewis6991/gitsigns.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = function() require'gitsigns'.setup() end,
            tag = 'v0.4'
        },
        {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function() require'lualine'.setup() end
        },
        { 'romgrk/barbar.nvim', requires = 'kyazdani42/nvim-web-devicons' },
        { 'ellisonleao/glow.nvim', cmd = 'Glow' },
        { 'glepnir/dashboard-nvim', config = function() require 'dashboard-config' end },

        -- search
        {
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function() require 'nvim-tree-config' end
        },
        {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/popup.nvim',
                'nvim-lua/plenary.nvim',
                { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
            },
            cmd = 'Telescope',
            config = function()
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                    }
                }
            end
        },

        -- movement and convenience
        {
            'terrortylor/nvim-comment',
            cmd = 'CommentToggle',
            config = function()
                require('nvim_comment').setup { marker_padding = true, comment_empty = false }
            end
        },
        { 'blackCauldron7/surround.nvim', config = function() end },
        { 'folke/which-key.nvim', config = function() require('which-key').setup() end },
        { 'mg979/vim-visual-multi', branch = 'master', keys = [[<C-n>]] },
        'ggandor/lightspeed.nvim',

        -- terminal
        {
            'akinsho/toggleterm.nvim',
            cmd = { 'TermExec', 'ToggleTerm' },
            config = function() require 'toggleterm-config' end,
            keys = [[<C-\>]]
        },

        -- colorscheme
        { 'folke/tokyonight.nvim', config = function() require 'colorscheme' end },

        -- miscillaneous
        'andweeb/presence.nvim',
        { 'sakhnik/nvim-gdb', config = function() vim.g.nvimgdb_use_find_executables = 0 end }
    }
end

function M.InstallPlugins(use) for _, plugin in ipairs(M.PluginList()) do use(plugin) end end

return M
