local ensure_packer = function ()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local plugins = {
    'wbthomason/packer.nvim',

    -- cmp
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'rafamadriz/friendly-snippets',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    { 'petertriho/cmp-git',      requires = 'nvim-lua/plenary.nvim' },
    'hrsh7th/cmp-cmdline',
    'onsails/lspkind.nvim',
    { 'hrsh7th/nvim-cmp',        config = function () require 'cmp-config' end },

    -- LSP
    { 'neovim/nvim-lspconfig',   requires = 'hrsh7th/cmp-nvim-lsp',              config = function () require 'lsp-config' end },
    { 'williamboman/mason.nvim', config = function () require 'mason'.setup {} end },

    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        config = function () require 'nvim-treesitter.configs'.setup { highlight = { enable = true } } end,
        run = ':TSUpdate'
    },

    -- UI
    { 'lewis6991/gitsigns.nvim',         config = function () require 'gitsigns'.setup() end },
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function () require 'lualine'.setup { options = { theme = 'tokyonight' } } end
    },
    {
        'romgrk/barbar.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function () require 'bufferline'.setup { icons = 'both' } end
    },

    -- search
    {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function () require 'nvim-tree'.setup() end
    },
    {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
        cmd = 'Telescope',
        config = function ()
            local telescope = require 'telescope'
            telescope.setup {
                defaults = { file_ignore_patterns = { '.git' } },
                pickers = { find_files = { hidden = true }, live_grep = { hidden = true } },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = 'smart_case' -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                }
            }
            telescope.load_extension('fzf')
        end
    },

    -- movement and editing
    {
        'terrortylor/nvim-comment',
        config = function () require 'nvim_comment'.setup { marker_padding = true, comment_empty = false } end
    },
    {
        'folke/which-key.nvim',
        config = function ()
            require 'which-key'.setup()
            require 'which-key-config'
        end
    },
    'ggandor/lightspeed.nvim',

    -- colorscheme
    {
        'folke/tokyonight.nvim',
        config = function ()
            require 'tokyonight'.setup { style = 'moon', transparent = 'true' }
            vim.cmd('colorscheme tokyonight')
        end
    },

    -- development
    {
        'mfussenegger/nvim-dap',
        config = function ()
            local dap = require('dap')
            dap.adapters.lldb = { type = 'executable', command = 'lldb-vscode', name = 'lldb' }
            dap.configurations.cpp = {
                {
                    name = 'Launch',
                    type = 'lldb',
                    request = 'launch',
                    program = function ()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = {}
                }
            }
        end
    },
    { 'rcarriga/nvim-dap-ui',            config = function () require 'dapui'.setup() end },
    { 'theHamsta/nvim-dap-virtual-text', config = function () require 'nvim-dap-virtual-text'.setup() end }
}

require 'packer'.startup({
    function (use)
        for _, plugin in ipairs(plugins) do use(plugin) end
        if packer_bootstrap then require 'packer'.sync() end
    end,
    config = { display = { open_fn = function () return require 'packer.util'.float({ border = 'single' }) end } },
    compile_on_sync = true,
    auto_clean = true
})
