local map = vim.keymap.set

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Down", silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Up", silent = true })

map("n", "<leader>w", "<cmd>wa<cr>", { desc = "Save All Files" })
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit All" })

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make Executable", silent = true })

map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>d", '"+p')
map("v", "<leader>d", '"+p')

-- szatau current file
map("n", "<leader><leader>", function()
  vim.cmd("so")
end)
