local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Navigation
keymap("n", "<C-h>", "<C-w>h" )
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<S-l>", ":bnext<CR>")
keymap("n", "<S-h>", ":bprevious<CR>")

-- Resize
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Left>", ":vertical resize +2<CR>")
keymap("n", "<C-Right>", ":vertical resize -2<CR>")

-- Close buffer
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>")

-- Tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Save
keymap("n", "<C-S>", ":w<CR>")

-- Telescope
local builtin = require('telescope.builtin')
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fg', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})
