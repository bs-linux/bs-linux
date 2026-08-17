-- Filesystem as an editable buffer: rename/delete/create by editing text, :w applies.
-- g? inside oil shows all keymaps.
require("oil").setup({
  default_file_explorer = true, -- replaces netrw
  view_options = { show_hidden = true },
  skip_confirm_for_simple_edits = true,
  keymaps = {
    -- oil's defaults use <C-h>/<C-l> (hsplit/refresh); those belong to window navigation
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    -- match fzf-lua: <C-v> vsplit, <C-s> split, <C-t> tab
    ["<C-v>"] = { "actions.select", opts = { vertical = true } },
    ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
    ["<C-r>"] = "actions.refresh",
  },
})

vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "File explorer" })
