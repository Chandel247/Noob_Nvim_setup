return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "auto",  -- Auto-detect from colorscheme
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff" },
            lualine_c = {
                {
                    "filename",
                    file_status = true,
                    path = 1,  -- Relative path
                    shorting_target = 40,
                },
                {
                    "diagnostics",
                    sources = { "nvim_lsp", "nvim_diagnostic" },
                    symbols = { error = " ", warn = " ", info = " ", hint = " " },
                },
            },
        },
        lualine_y = { "progress" },
        lualine_z = { "location", "searchcount" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    extensions = { "lazy", "trouble", "quickfix" },
}
