local wk = require 'which-key'

wk.register({ k = { j = { '<ESC>', 'Escape' } } }, { mode = 'i' })

wk.register({
    t = {
        name = '+Tabs',
        q = { '<cmd>BufferClose<CR>', 'Close Tab' },
        p = { '<cmd>BufferPick<CR>', 'Pick Tab' },
        o = { '<cmd>BufferOrderByBufferNumber<CR>', 'Order Tabs by number' }
    },
    l = {
        name = '+LSP',
        o = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Open diagnostic' },
        k = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Go to prev diagnostic' },
        j = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Go to next diagnostic' },
        q = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'Set diagnostics in loclist' },
        D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'Go to declaration' },
        d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition' },
        h = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Hover' },
        i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Go to implementation' },
        s = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'See signature' },
        t = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'See type definition' },
        c = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code action' },
        f = { '<cmd>lua vim.lsp.buf.format()<CR>', 'Format' },
        r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
        e = { '<cmd>lua vim.lsp.buf.references()<CR>', 'See references' },
        w = {
            name = '+workspace',
            a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add folder' },
            r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove folder' },
            l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List folder' }
        }
    },
    f = {
        name = '+File Explorer',
        e = { '<cmd>NvimTreeFocus<CR>', 'Focus File Explorer' },
        o = { '<cmd>NvimTreeToggle<CR>', 'Toggle File Explorer' },
        f = { '<cmd>Telescope find_files<CR>', 'Open Telescope file searcher' },
        l = { '<cmd>Telescope live_grep<CR>', 'Open Telescope live grep' },
        b = { '<cmd>Telescope buffers<CR>', 'Open Telescope buffer searcher' }
    },
    h = {
        name = '+Gitsigns',
        p = { '<cmd>Gitsigns preview_hunk<CR>', 'Preview hunk' },
        s = { '<cmd>Gitsigns stage_hunk<CR>', 'Stage hunk' },
        u = { '<cmd>Gitsigns undo_stage_hunk<CR>', 'Undo stage hunk' },
        r = { '<cmd>Gitsigns reset_hunk<CR>', 'Reset hunk' },
        b = { '<cmd>Gitsigns blame_line<CR>', 'Blame line' },
        d = { '<cmd>Gitsigns diffthis<CR>', 'Diff this' },
        S = { '<cmd>Gitsigns stage_buffer<CR>', 'Stage buffer' },
        ['['] = { '<cmd>Gitsigns prev_hunk<CR>', 'Previous hunk' },
        [']'] = { '<cmd>Gitsigns next_hunk<CR>', 'Next hunk' }
    },
    d = {
        name = '+DAP',
        c = { '<cmd>DapContinue<CR>', 'Continue' },
        o = { '<cmd>DapStepOut<CR>', 'Step out' },
        i = { '<cmd>DapStepInto<CR>', 'Step into' },
        s = { '<cmd>DapStepOver<CR>', 'Step over' },
        b = { '<cmd>DapToggleBreakpoint<CR>', 'Toggle breakpoint' },
        t = { '<cmd>DapTerminate<CR>', 'Terminate' },
        r = { '<cmd>DapRestartFrame<CR>', 'Restart frame' },
        u = { '<cmd>lua require\'dapui\'.toggle()<CR>', 'Toggle UI' }
    }
}, { prefix = '<leader>' })

-- barbar
wk.register({
    -- Move to previous/next
    ['<A-h>'] = { '<Cmd>BufferPrevious<CR>', 'Previous Buffer' },
    ['<A-l>'] = { '<Cmd>BufferNext<CR>', 'Next Buffer' },
    -- Re-order to previous/next
    ['<A-H>'] = { '<Cmd>BufferMovePrevious<CR>', 'Move previous buffer' },
    ['<A-L>'] = { '<Cmd>BufferMoveNext<CR>', 'Move next buffer' },
    -- Goto buffer in position...
    ['<A-1>'] = { '<Cmd>BufferGoto 1<CR>', 'Go to buffer 1' },
    ['<A-2>'] = { '<Cmd>BufferGoto 2<CR>', 'Go to buffer 2' },
    ['<A-3>'] = { '<Cmd>BufferGoto 3<CR>', 'Go to buffer 3' },
    ['<A-4>'] = { '<Cmd>BufferGoto 4<CR>', 'Go to buffer 4' },
    ['<A-5>'] = { '<Cmd>BufferGoto 5<CR>', 'Go to buffer 5' },
    ['<A-6>'] = { '<Cmd>BufferGoto 6<CR>', 'Go to buffer 6' },
    ['<A-7>'] = { '<Cmd>BufferGoto 7<CR>', 'Go to buffer 7' },
    ['<A-8>'] = { '<Cmd>BufferGoto 8<CR>', 'Go to buffer 8' },
    ['<A-9>'] = { '<Cmd>BufferGoto 9<CR>', 'Go to buffer 9' },
    ['<A-0>'] = { '<Cmd>BufferLast<CR>', 'Go to last buffer' },
    -- Pin/unpin buffer
    ['<A-p>'] = { '<Cmd>BufferPin<CR>', 'Pin buffer' },
    -- Close buffer
    ['<A-c>'] = { '<Cmd>BufferClose<CR>', 'Close buffer' },
    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    --                 :BufferCloseAllButCurrent
    --                 :BufferCloseAllButPinned
    --                 :BufferCloseAllButCurrentOrPinned
    --                 :BufferCloseBuffersLeft
    --                 :BufferCloseBuffersRight
    -- Magic buffer-picking mode
    ['<C-p>'] = { '<Cmd>BufferPick<CR>', '' },
    -- Sort automatically by...
    ['<Leader>b'] = {
        name = '+Buffer',
        b = { '<Cmd>BufferOrderByBufferNumber<CR>', 'Order by buffer' },
        d = { '<Cmd>BufferOrderByDirectory<CR>', 'Order by directory' },
        l = { '<Cmd>BufferOrderByLanguage<CR>', 'Order by language' },
        w = { '<Cmd>BufferOrderByWindowNumber<CR>', 'Order by window' }
    }
})
