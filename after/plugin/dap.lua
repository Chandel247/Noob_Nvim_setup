local dap = require("dap")
local dapui = require("dapui")

local base = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>dc", dap.continue,
  vim.tbl_extend("force", base, { desc = "DAP: Continue" }))

vim.keymap.set("n", "<leader>di", dap.step_into,
  vim.tbl_extend("force", base, { desc = "DAP: Step into" }))

vim.keymap.set("n", "<leader>do", dap.step_over,
  vim.tbl_extend("force", base, { desc = "DAP: Step over" }))

vim.keymap.set("n", "<leader>dO", dap.step_out,
  vim.tbl_extend("force", base, { desc = "DAP: Step out" }))

vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint,
  vim.tbl_extend("force", base, { desc = "DAP: Toggle breakpoint" }))

vim.keymap.set("n", "<leader>dB", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
  end,
  vim.tbl_extend("force", base, { desc = "DAP: Conditional breakpoint" }))

vim.keymap.set("n", "<leader>dq", function()
    dap.terminate()
    dapui.close()
  end,
  vim.tbl_extend("force", base, { desc = "DAP: Terminate" }))

vim.keymap.set("n", "<leader>du", dapui.toggle,
  vim.tbl_extend("force", base, { desc = "DAP: Toggle UI" }))

vim.keymap.set({ "n", "v" }, "<leader>de", dapui.eval,
  vim.tbl_extend("force", base, { desc = "DAP: Eval expression" }))

