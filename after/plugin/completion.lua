-- after/plugin/completion.lua
local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
  print("ERROR: nvim-cmp not loaded!")
  return
end

local luasnip_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_ok then
  print("WARNING: LuaSnip not loaded!")
end

-- Setup nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      if luasnip_ok then
        luasnip.lsp_expand(args.body)
      else
        -- Fallback if LuaSnip isn't available
        vim.fn["vsnip#anonymous"](args.body)
      end
    end,
  },
  
  -- Key mappings for completion
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
  
  -- Sources for completion (ORDER MATTERS!)
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },    -- This MUST be first for LSP completion
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
  
  -- Visual formatting
  formatting = {
    format = function(entry, vim_item)
      -- Show source of completion
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        luasnip = '[Snip]',
        buffer = '[Buf]',
        path = '[Path]',
      })[entry.source.name]
      return vim_item
    end,
  },
})

print("nvim-cmp configured successfully")

