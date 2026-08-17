-- Magit-style git UI. Complements gitsigns (hunks in the buffer) with a status
-- buffer for staging, committing, branching, pushing, logs.
local neogit = require("neogit")

neogit.setup({
  kind = "tab", -- open status in its own tab; "split"/"floating" also work
  graph_style = "unicode",
  integrations = { fzf_lua = true }, -- branch/commit selectors go through fzf-lua
})

local map = vim.keymap.set
map("n", "<leader>gg", function()
  neogit.open()
end, { desc = "Neogit status" })
map("n", "<leader>gc", function()
  neogit.open({ "commit" })
end, { desc = "Neogit commit" })
map("n", "<leader>gl", function()
  neogit.open({ "log" })
end, { desc = "Neogit log" })
map("n", "<leader>gP", function()
  neogit.open({ "push" })
end, { desc = "Neogit push" })
