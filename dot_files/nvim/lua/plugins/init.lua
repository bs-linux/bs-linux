-- Plugin declarations (vim.pack, built into Neovim 0.12) and loading of per-plugin
-- setup modules. Lockfile: ~/.config/nvim/nvim-pack-lock.json (managed by vim.pack).
-- Update everything with :lua vim.pack.update()

local function gh(repo)
  return "https://github.com/" .. repo
end

-- Hooks must be registered BEFORE vim.pack.add() so they fire on first install.
vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("user_pack_hooks", { clear = true }),
  callback = function(ev)
    -- Re-sync treesitter parsers whenever nvim-treesitter itself is updated
    if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
      require("nvim-treesitter").update()
    end
  end,
})

vim.pack.add({
  gh("nvim-tree/nvim-web-devicons"),
  -- Parser/query installer only; highlighting is native. `main` branch is the
  -- rewrite; never pin to a semver range (v0.9.x tags are the legacy plugin).
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
  -- 1.x: prebuilt fuzzy binary is downloaded because the checkout sits on a tag.
  -- 2.x (main) is a breaking rewrite; revisit deliberately.
  { src = gh("Saghen/blink.cmp"), version = vim.version.range("1.*") },
  gh("b0o/SchemaStore.nvim"),
  gh("NMAC427/guess-indent.nvim"),
  gh("lewis6991/gitsigns.nvim"),
  gh("nvim-lua/plenary.nvim"), -- required by neogit
  gh("NeogitOrg/neogit"),
  gh("echasnovski/mini.statusline"),
  gh("echasnovski/mini.icons"),
  gh("folke/which-key.nvim"),
  gh("stevearc/conform.nvim"),
  gh("stevearc/oil.nvim"),
  gh("ibhagwan/fzf-lua"),
  gh("mbbill/undotree"),
  gh("christoomey/vim-tmux-navigator"),
  gh("MeanderingProgrammer/render-markdown.nvim"),
})

for _, mod in ipairs({
  "treesitter",
  "blink",
  "conform",
  "oil",
  "fzf",
  "gitsigns",
  "neogit",
  "whichkey",
  "statusline",
  "misc",
}) do
  local ok, err = pcall(require, "plugins." .. mod)
  if not ok then
    vim.notify(("plugins.%s failed: %s"):format(mod, err), vim.log.levels.ERROR)
  end
end
