# Noob_Nvim_setup

A beginner-friendly, modern Neovim setup powered by **Lua**. This config brings together essential plugins, easy keymaps, and helpful defaults—so you can be productive right away!

---

## ⭐ Features

- Fast plugin management with [`lazy.nvim`](https://github.com/folke/lazy.nvim)
- Language support and autocomplete (LSP, snippets, completions)
- Beautiful and efficient fuzzy finding/search
- Git tools in the editor
- Syntax highlighting for modern languages
- Useful utilities like undotree, file jumper, etc.
- Simple configuration structure for easy customization

---

## 📦 Plugins Included

| Plugin | Description |
|--------|-------------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Built-in language server support |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Autocompletion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP source for nvim-cmp |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Buffer words source for nvim-cmp |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Filesystem completion |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | LuaSnip source for nvim-cmp |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finding (files, text, etc) |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting, code parsing |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Extra lua functions (required for Telescope, etc.) |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Powerful Git integration |
| [harpoon](https://github.com/ThePrimeagen/harpoon) | Quick file navigation |
| [mini.nvim](https://github.com/echasnovski/mini.nvim) | Helpful utilities collection |
| [everforest](https://github.com/sainnhe/everforest) | Theme/colorscheme |
| [undotree](https://github.com/mbbill/undotree) | Visualizes undo history |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Manage LSP servers |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Mason + LSP bridge |

---

## 🚀 Getting Started

1. **Requirements**  
   - [Neovim (latest)](https://neovim.io/)
   - [git](https://git-scm.com/)

2. **Installation**
   ```sh
   git clone https://github.com/Chandel247/Noob_Nvim_setup.git
   mkdir -p ~/.config/nvim
   cp -r Noob_Nvim_setup/* ~/.config/nvim/
   ```

3. **First launch**
   - Open Neovim: `nvim`
   - Plugins will automatically install on first run!

---

## 🗂️ Configuration Structure

- **init.lua**: Loads core configuration.
- **lua/shiv/**
  - `init.lua` – Loads everything else
  - `lazy.lua` – Bootstraps lazy.nvim plugin manager with your plugins
  - `remap.lua` – Custom keymaps
  - `set.lua` – Basic settings
- **lua/plugins/**: Plugin-specific config files
- **after/plugin/**: Per-plugin extra config and keymaps  
- **lazy-lock.json**: Locks plugin versions

---

## ℹ️ Customization

- Edit **lua/shiv/set.lua** and **lua/shiv/remap.lua** for your settings and keymaps.
- To add or remove plugins, edit **lua/shiv/lazy.lua** and **lua/plugins/**.
- For advanced plugin options, see each plugin's official docs (linked above).

---

## ❓ Troubleshooting

- First run: stay online so plugins can download.
- Update plugins anytime with inside nvim: `:Lazy update`
- Problems? Check messages with `:messages` or open an issue!

---

**Happy Neoviming!**

---
