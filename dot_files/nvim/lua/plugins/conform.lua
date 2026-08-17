local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    toml = { "taplo" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    css = { "prettier" },
    markdown = { "prettier" },
    python = { "ruff_organize_imports", "ruff_format" },
    sh = { "shfmt" },
    bash = { "shfmt" },
  },
  -- Fall back to the LSP's formatter for filetypes not listed above
  default_format_opts = { lsp_format = "fallback" },
  -- format_on_save intentionally off: reflowing someone else's YAML/markdown/conf
  -- files is destructive. Format explicitly with <leader>lf.
})

vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  conform.format({ async = true })
end, { desc = "Format buffer/selection" })

-- gq uses conform
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
