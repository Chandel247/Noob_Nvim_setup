return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- 1. Global LSP defaults via new API (applies to all servers)
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        -- per-buffer mappings are defined in after/plugin/lsp_keymaps.lua via LspAttach
        -- keep this minimal or empty here
      end,
    })

    -- 2. Per-server config using built-in vim.lsp.config
    --    Names must match nvim-lspconfig's server names.[141][149]

    -- C / C++
    vim.lsp.config("clangd", {
      cmd = { "clangd" },
      filetypes = { "c", "cpp", "objc", "objcpp" },
    })

    -- Python (basedpyright is recommended on 0.11+)[127][149]
    vim.lsp.config("basedpyright", {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "standard",
          },
        },
      },
    })

    -- Lua (for Neovim config)
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    })
        
    -- 3. Enable all configured servers
    vim.lsp.enable({
      "clangd",
      "basedpyright",
      "lua_ls",
    })
  end,
}

