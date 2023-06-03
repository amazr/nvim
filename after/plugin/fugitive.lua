vim.keymap.set("n", "<leader>gg", "<cmd>below Git<CR>");
vim.keymap.set("n", "<leader>cc", "<cmd>below Git commit<CR>");
vim.keymap.set("n", "<leader>gp", "<cmd>Git -c push.default=current push<CR>")
vim.keymap.set("n", "<leader>gb", "<cmd>below Git branch<CR>");
vim.keymap.set("n", "<leader>gcd", "<cmd>below Git checkout develop<CR><cmd>Git pull<CR>");
vim.keymap.set("n", "<leader>gl", "<cmd>Git pull<CR>");
vim.keymap.set("n", "<leader>gcb", ":Git checkout -b ");
vim.keymap.set("n", "<leader>gcc", ":Git checkout yi$<left>P<CR>");

vim.keymap.set("n", "<leader>gpu", "<cmd>Git -c push.default=current push -u origin<CR>");

vim.keymap.set("n", "<leader>gD", function ()
    local branch = vim.call('expand','<cword>')
    vim.cmd("Git branch -D " .. branch)
end)


