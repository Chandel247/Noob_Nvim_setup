require("nvim-treesitter.configs").setup({
	ensure_installed = { "python", "lua", "cpp", "c" },
	sync_install = false,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})

