
-- after/plugin/lsp.lua

-- Get capabilities for completion
local cmp_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
local capabilities = vim.lsp.protocol.make_client_capabilities()

if cmp_ok then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- LSP keymaps on attach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
  end,
})

-- NEW API: Configure servers using vim.lsp.config
-- This replaces lspconfig[server].setup()

-- Set global capabilities for all servers
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- Configure clangd for C/C++
vim.lsp.config('clangd', {
  cmd = { "clangd", "--background-index" },
})

-- Configure pyright for Python (uses defaults, no custom config needed)
vim.lsp.config('pyright', {})

-- NEW API: Enable the servers
-- This replaces the setup() calls
vim.lsp.enable({'clangd', 'pyright'})

