require("blink.cmp").setup({
  -- 'default' preset: <C-y> accept, <C-space> show/toggle docs, <C-n>/<C-p> next/prev,
  -- <C-e> hide, <C-b>/<C-f> scroll docs, <Tab>/<S-Tab> snippet jump
  keymap = { preset = "default" },
  appearance = { nerd_font_variant = "mono" },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 300 },
    menu = { draw = { treesitter = { "lsp" } } },
  },
  signature = { enabled = true },
  -- Prebuilt Rust matcher is downloaded automatically (checkout is on a v1.x tag).
  -- If that ever fails, switch to implementation = "lua".
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
