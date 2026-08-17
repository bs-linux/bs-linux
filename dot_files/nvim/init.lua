-- Neovim 0.12 config for editing config files (lua, yaml, toml, json, css, python, sh…).
--
--   lua/config/options.lua   options, colorscheme, leader
--   lua/config/keymaps.lua   non-plugin keymaps
--   lua/config/autocmds.lua  formatoptions, yank highlight, treesitter start
--   lua/plugins/init.lua     vim.pack.add() + loads lua/plugins/<name>.lua
--   lua/config/lsp.lua       diagnostics, LspAttach keymaps, blink capabilities
--   lsp/<server>.lua         per-server configs (vim.lsp.config convention)

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("plugins") -- must precede config.lsp (blink.cmp capabilities)
require("config.lsp")

vim.lsp.enable({
  "lua_ls",
  "jsonls",
  "yamlls",
  "taplo",
  "basedpyright",
  "ruff",
  "bashls",
  "cssls",
})
