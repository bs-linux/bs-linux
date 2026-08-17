-- LSP client-side config. Per-server configs live in lsp/<name>.lua and are enabled
-- with vim.lsp.enable() in init.lua.

-- Defaults applied to every server (merged with lsp/<name>.lua)
vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  root_markers = { ".git" },
})

vim.diagnostic.config({
  virtual_text = { current_line = false, spacing = 2 },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  underline = true,
  severity_sort = true,
  update_in_insert = false,
  float = { border = "rounded", source = true },
})

-- Buffer-local keymaps when a server attaches.
-- Neovim 0.12 already provides: K hover, grr references, grn rename, gra code action,
-- gri implementation, grt type definition, gO document symbols, [d ]d diagnostics, <C-w>d.
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    local function map(lhs, rhs, desc, mode)
      vim.keymap.set(mode or "n", lhs, rhs, { buffer = ev.buf, desc = desc })
    end

    map("gd", vim.lsp.buf.definition, "Goto definition")
    map("gD", vim.lsp.buf.declaration, "Goto declaration")
    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "v" })
    map("<leader>ld", vim.diagnostic.setloclist, "Diagnostics to loclist")
    map("<leader>le", vim.diagnostic.open_float, "Diagnostic under cursor")
    map("<leader>li", "<cmd>checkhealth vim.lsp<CR>", "LSP info")
    map("<leader>lr", vim.lsp.buf.references, "References")

    -- basedpyright owns hover for Python; ruff's hover is redundant
    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end
  end,
})
