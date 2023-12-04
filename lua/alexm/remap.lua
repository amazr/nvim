vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "viwdi", { silent = true })

vim.keymap.set("n", "G", "G$")
vim.keymap.set("n", "gg", "gg0")
vim.keymap.set("n", "<leader><Left>", "0")
vim.keymap.set("n", "<leader><Right>", "$")
vim.keymap.set("v", "<leader><Left>", "0")
vim.keymap.set("v", "<leader><Right>", "$")
vim.keymap.set("n", "M", "50%")
vim.keymap.set("i", "[", "[]<left>")
vim.keymap.set("i", "{", "{}<left>")
vim.keymap.set("i", "(", "()<left>")
vim.keymap.set("i", "<", "<><left>")
vim.keymap.set("i", '"', '""<left>')
vim.keymap.set("i", "'", "''<left>")
vim.keymap.set("n", "<leader>;", "$a;")
vim.keymap.set("n", "<leader>4", "<cmd>vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<leader>6", "<cmd>vertical resize -5<CR>", { silent = true })
vim.keymap.set("n", "<leader>8", "<cmd>res +5<CR>", { silent = true })
vim.keymap.set("n", "<leader>2", "<cmd>res -5<CR>", { silent = true })
vim.keymap.set("v", "[", "di[]<left><Esc>p")
vim.keymap.set("v", "{", "di{}<left><Esc>p")
vim.keymap.set("v", "(", "di()<left><Esc>p")
vim.keymap.set("v", "<", "di<><left><Esc>p")
vim.keymap.set("v", "'", "di''<left><Esc>p")
vim.keymap.set("v", '"', 'di""<left><Esc>p')
vim.keymap.set("t", "<C-n><C-n>", "<C-\\><C-n>")

vim.keymap.set("n", "<left>", "<nop>")
vim.keymap.set("n", "<right>", "<nop>")
vim.keymap.set("n", "<up>", "<nop>")
vim.keymap.set("n", "<down>", "<nop>")

vim.keymap.set("i", "<C-h>", "<left>")
vim.keymap.set("i", "<C-l>", "<right>")
vim.keymap.set("i", "<C-k>", "<up>")
vim.keymap.set("i", "<C-j>", "<down>");

vim.keymap.set("n", "<leader>l", "$")
vim.keymap.set("n", "<leader>h", "0")


vim.api.nvim_set_keymap('i', '<C-/>', 'copilot#Accept("<CR>")', {expr=true, silent=true})
vim.g.copilot_no_tab_map = true
