-- Small plugins that need little or no configuration.

require("nvim-web-devicons").setup({})
require("mini.icons").setup({}) -- icons for which-key and render-markdown

-- Detect indent style per file (2-space YAML, tab-indented conf, 4-space Lua…)
require("guess-indent").setup({})

-- Undo history browser (pairs with undofile = true)
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_WindowLayout = 2
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Undo tree" })

-- vim-tmux-navigator: no setup; defines <C-h/j/k/l> and <C-\> itself.
-- Falls back to plain window movement when not inside tmux.

-- SchemaStore.nvim: no setup; consumed by lsp/jsonls.lua and lsp/yamlls.lua.

-- Markdown rendering (optional, low priority)
require("render-markdown").setup({
  completions = { blink = { enabled = true } },
  latex = { enabled = false }, -- would need a latex->text converter; not needed here
})
