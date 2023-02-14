local capabilities = require 'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { 'clangd', 'lua_ls', 'pylsp', 'yamlls', 'rust_analyzer' }

local extended_opts = {
    yamlls = function (opts) opts.settings = { yaml = { format = { enable = true, singleQuote = true } } } end
}

local lspconfig = require 'lspconfig'
for _, lsp in pairs(servers) do
    if lspconfig[lsp] then
        local opts = { capabilities = capabilities }
        if extended_opts[lsp] then extended_opts[lsp](opts) end
        lspconfig[lsp].setup(opts)
    end
end
