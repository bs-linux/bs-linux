-- nvim-treesitter (main) is used only to install parsers + queries into
-- stdpath("data")/site, which is on runtimepath. Highlighting itself is started by
-- the FileType autocmd in lua/config/autocmds.lua.
local ts = require("nvim-treesitter")
ts.setup({})

-- Bundled with Neovim: c, lua, markdown, markdown_inline, query, vim, vimdoc
local wanted = {
  "bash",
  "css",
  "diff",
  "dockerfile",
  "git_config",
  "gitcommit",
  "gitignore",
  "html", -- render-markdown uses it for inline html
  "ini",
  "json", -- also used for jsonc (Neovim maps jsonc -> json)
  "python",
  "regex",
  "ssh_config",
  "toml",
  "yaml",
}

local installed = ts.get_installed("parsers")
local available = ts.get_available()
local missing = vim.tbl_filter(function(lang)
  return not vim.tbl_contains(installed, lang) and vim.tbl_contains(available, lang)
end, wanted)

if #missing > 0 then
  ts.install(missing) -- async; compiles with tree-sitter-cli + cc on first run
end
