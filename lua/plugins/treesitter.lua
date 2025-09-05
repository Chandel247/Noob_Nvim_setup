-- THIS IS THE NEW WAY (CORRECT FOR LAZY.NVIM)
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate', -- Packer's `run` is `build` in lazy.nvim
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
      -- Add other parsers as needed
      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
