-- Non-plugin keymaps. Plugin keymaps live next to their plugin setup in lua/plugins/.
-- <C-h/j/k/l> window navigation is provided by vim-tmux-navigator.
local map = vim.keymap.set

-- Registers
map("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Splits
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split window horizontally" })
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Misc
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
