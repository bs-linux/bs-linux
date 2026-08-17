---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".stylua.toml", "stylua.toml", ".git" },
  settings = { Lua = {} },
  on_init = function(client)
    -- Respect a project's own .luarc.json; otherwise assume Neovim Lua.
    local root = client.workspace_folders and client.workspace_folders[1] and client.workspace_folders[1].name
    if root and (vim.uv.fs_stat(root .. "/.luarc.json") or vim.uv.fs_stat(root .. "/.luarc.jsonc")) then
      return
    end
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua or {}, {
      runtime = { version = "LuaJIT", path = { "lua/?.lua", "lua/?/init.lua" } },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library",
          -- Uncomment for completion of installed plugin APIs (slower indexing):
          -- vim.fn.stdpath("data") .. "/site/pack/core/opt",
        },
      },
      telemetry = { enable = false },
    })
    client:notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end,
}
