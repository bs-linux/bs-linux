local fzf = require("fzf-lua")

-- fzf-native profile also routes vim.ui.select (code actions, etc.) through fzf
fzf.setup({ "fzf-native" })

local map = vim.keymap.set
map("n", "<leader>ff", fzf.files, { desc = "Find files" })
map("n", "<leader>fg", fzf.live_grep, { desc = "Live grep" })
map("n", "<leader>fw", fzf.grep_cword, { desc = "Grep word under cursor" })
map("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
map("n", "<leader>fr", fzf.oldfiles, { desc = "Recent files" })
map("n", "<leader>fh", fzf.helptags, { desc = "Help tags" })
map("n", "<leader>fk", fzf.keymaps, { desc = "Keymaps" })
map("n", "<leader>fd", fzf.diagnostics_document, { desc = "Document diagnostics" })
map("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "Document symbols" })
map("n", "<leader>fc", function()
  fzf.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Neovim config files" })
map("n", "<leader>f/", fzf.resume, { desc = "Resume last picker" })
