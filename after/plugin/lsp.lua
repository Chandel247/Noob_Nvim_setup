-- after/plugin/lsp.lua
local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  return
end

local cmp_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
local capabilities = cmp_ok and cmp_lsp.default_capabilities() or {}

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

-- Configure clangd for C/C++
lspconfig.clangd.setup({
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
})

-- Configure pyright for Python
lspconfig.pyright.setup({
  capabilities = capabilities,
})

