-- Uses shellcheck and shfmt from PATH automatically.
---@type vim.lsp.Config
return {
  cmd = { "bash-language-server", "start" },
  filetypes = { "bash", "sh", "zsh" },
  settings = {
    bashIde = { globPattern = "*@(.sh|.inc|.bash|.command)" },
  },
}
