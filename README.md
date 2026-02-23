# Neovim configuration (personal)

This repository contains a small, opinionated Neovim configuration using `lazy.nvim` as the plugin manager. It focuses on a minimal, modern setup with LSP, completion, treesitter, Telescope, debugging (DAP), and a few convenience plugins.

## Quick start

- Prerequisites: Neovim 0.9+ (or recent nightly), git, a system `make` for native builds (telescope-fzf-native).
- Install by cloning into your Neovim config folder (this repo is laid out for `~/.config/nvim`).
- The config bootstraps `folke/lazy.nvim` automatically (see `lua/shiv/lazy.lua`).

## Key files

- `init.lua` — entry point (loads `shiv` and `shiv.lazy`).
- `lua/shiv/lazy.lua` — lazy.nvim setup and plugin import.
- `lua/shiv/remap.lua` — global leader and basic mappings.
- `lua/plugins/*` — individual plugin specs (one file per area).
- `after/plugin/*` — additional plugin-specific mappings and setup.

## Plugins (high level)

The plugin specs live in `lua/plugins`. Main plugins included:

- `folke/lazy.nvim` (bootstrapped in `lua/shiv/lazy.lua`) — plugin manager.
- `XXiaoA/atone.nvim` — undo tree / visualizer (theme/plugin file: `lua/plugins/atone.lua`).
- `hrsh7th/nvim-cmp` (+sources and `LuaSnip`) — completion engine (`lua/plugins/completion.lua`).
- `mfussenegger/nvim-dap` (+ `nvim-dap-ui`, `nvim-dap-python`, virtual text) — debugging (`lua/plugins/dap.lua`).
- `sainnhe/everforest` — colorscheme (`lua/plugins/everforest.lua`).
- `tpope/vim-fugitive` — Git integration (`lua/plugins/fugitive.lua`; keymaps in `after/plugin/fugitive.lua`).
- `ThePrimeagen/harpoon` (branch `harpoon2`) — quick file marks (`lua/plugins/harpoon.lua` and `after/plugin/harpoon.lua`).
- `neovim/nvim-lspconfig` + `mason-org/mason.nvim` + `mason-lspconfig` — LSP and server management (`lua/plugins/lsp.lua`, `lua/plugins/mason.lua`).
- `nvim-lualine/lualine.nvim` — statusline (`lua/plugins/lualine.lua`).
- `nvim-telescope/telescope.nvim` (+ `fzf-native`) — fuzzy finder (`lua/plugins/telescope.lua`, `after/plugin/telescope.lua`).
- `nvim-treesitter/nvim-treesitter` — syntax/treesitter support (`lua/plugins/treesitter.lua`, `after/plugin/treesitter.lua`).

Each plugin file contains configuration or lazy-loading hints. See `lua/plugins/` for individual options.

## Keybindings (summary)

Global leader:

- Leader is set to space in `lua/shiv/remap.lua`.

General mapping found in `lua/shiv/remap.lua`:

- `<leader>pv` — open `:Ex` (file browser).

LSP mappings (added on `LspAttach`, `after/plugin/lsp.lua`):

- `gd` — go to definition
- `gD` — go to declaration
- `gi` — go to implementation
- `gr` — references
- `gt` — type definition
- `K` — hover
- `<leader>rn` — rename
- `<leader>ca` — code action
- `[d` / `]d` — previous / next diagnostic
- `<leader>vd` — show diagnostics (float)
- `<leader>fm` — format buffer (async)

Fugitive (Git) mappings (`after/plugin/fugitive.lua`):

- `<leader>gs` — run `:Git` (open fugitive status)

Harpoon mappings (`after/plugin/harpoon.lua`):

- `<leader>a` — add current file to Harpoon
- `<C-e>` — toggle Harpoon quick menu (also wired to a Telescope view)
- `<leader>1`..`<leader>4` — jump to Harpoon marks 1–4
- `<leader>[` / `<leader>]` — previous / next buffer in Harpoon list

DAP (debugging) mappings (`after/plugin/dap.lua`):

- `<leader>dc` — DAP: continue
- `<leader>di` — step into
- `<leader>do` — step over
- `<leader>dO` — step out
- `<leader>db` — toggle breakpoint
- `<leader>dB` — conditional breakpoint (prompt)
- `<leader>dq` — terminate debug session + close UI
- `<leader>du` — toggle DAP UI
- `<leader>de` — eval expression (normal & visual)

Telescope mappings (`after/plugin/telescope.lua`):

- `<leader>pf` — Telescope find files
- `<C-p>` — Telescope git files
- `<leader>ps` — Telescope grep (prompts for query)

Atone (undo tree) mappings (`after/plugin/atone.lua`):

- `<leader>u` — toggle / open Atone (two mappings exist; one toggles and another opens)
- `<leader>c` — close Atone tree
- `<leader>f` — focus Atone tree

Completion mappings (from `lua/plugins/completion.lua` via nvim-cmp):

- `<C-b>` / `<C-f>` — scroll docs
- `<C-Space>` — trigger completion
- `<C-e>` — abort completion
- `<CR>` — confirm selection

Notes

- LSP server installation and management is handled by `mason` (`lua/plugins/mason.lua`).
- Some plugin mappings live in `after/plugin/*` files — check those files for the definitive keymap list.
- Telescope `fzf-native` requires a native build (`make`).
