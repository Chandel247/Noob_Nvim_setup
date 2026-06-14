require("nvim-treesitter.configs").setup({
    ensure_installed = { "python", "lua", "cpp", "c" },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = {
        enable = true,
        disable = {"c", "cpp"},
    },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt_local.cindent = true
        vim.opt_local.equalprg = "clang-format"
    end,
})
