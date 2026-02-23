-- Toggle the tree (most common)
vim.keymap.set("n", "<leader>u", "<cmd>Atone toggle<CR>", { desc = "Toggle undo tree" })

-- Open tree (always opens, doesn't close if already open)
vim.keymap.set("n", "<leader>u", "<cmd>Atone open<CR>", { desc = "Open undo tree" })

-- Close tree
vim.keymap.set("n", "<leader>c", "<cmd>Atone close<CR>", { desc = "Close undo tree" })

-- Focus into tree window
vim.keymap.set("n", "<leader>f", "<cmd>Atone focus<CR>", { desc = "Focus undo tree" })
