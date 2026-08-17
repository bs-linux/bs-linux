-- Lint diagnostics + code actions + formatting for Python. Hover is disabled in
-- lua/config/lsp.lua so basedpyright owns it.
---@type vim.lsp.Config
return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
  init_options = { settings = { lineLength = 100 } },
}
