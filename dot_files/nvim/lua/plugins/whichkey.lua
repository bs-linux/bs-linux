local wk = require("which-key")

wk.setup({
  preset = "helix",
  delay = 300,
})

wk.add({
  { "<leader>b", group = "buffer" },
  { "<leader>f", group = "find" },
  { "<leader>g", group = "git" },
  { "<leader>l", group = "lsp/format" },
  { "<leader>s", group = "split" },
})
