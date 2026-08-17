---@type vim.lsp.Config
return {
  cmd = { "yaml-language-server", "--stdio" },
  -- Neovim 0.12 detects compose/gitlab-ci/helm files as plain "yaml"; SchemaStore
  -- picks the right schema by filename.
  filetypes = { "yaml" },
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      -- Built-in store must be off so SchemaStore.nvim's catalog is used
      schemaStore = { enable = false, url = "" },
      schemas = require("schemastore").yaml.schemas(),
      validate = true,
      hover = true,
      completion = true,
      format = { enable = false }, -- conform/prettier handles formatting
      keyOrdering = false,
    },
  },
}
