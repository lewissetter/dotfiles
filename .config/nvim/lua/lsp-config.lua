local capabilities = require'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = { 'clangd', 'sumneko_lua', 'jedi_language_server', 'efm', 'yamlls' }

local extended_opts = {
    efm = function(opts) opts.filetypes = { 'lua', 'python' } end,
    yamlls = function(opts) opts.settings = { yaml = { format = { enable = true, singleQuote = true } } } end
}

local lspconfig = require 'lspconfig'
for _, lsp in pairs(servers) do
    if lspconfig[lsp] then
        local opts = { capabilities = capabilities }
        if extended_opts[lsp] then extended_opts[lsp](opts) end
        lspconfig[lsp].setup(opts)
    end
end
