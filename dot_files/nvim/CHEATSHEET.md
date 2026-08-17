# Neovim cheatsheet

Leader is `<Space>`. Press `<Space>` and wait ~300 ms and **which-key** pops up showing every
leader binding — the fastest way to (re)learn any of this. Inside a plugin window, `g?` or `?`
usually shows that plugin's own keys.

Groups: `<leader>f` find · `<leader>b` buffer · `<leader>s` split · `<leader>g` git · `<leader>l` lsp/format

---

## Windows, splits, buffers

| Key | Action |
|---|---|
| `<C-h>` `<C-j>` `<C-k>` `<C-l>` | Move between windows (and tmux panes if inside tmux) |
| `<leader>sv` / `<leader>sh` | Split vertically / horizontally |
| `<C-Up>` `<C-Down>` | Resize height ±2 |
| `<C-Left>` `<C-Right>` | Resize width ±2 |
| `<leader>bn` / `<leader>bp` | Next / previous buffer |
| `<leader>bd` | Delete (close) buffer |
| `<Esc>` (normal mode) | Clear search highlight |

## Registers

| Key | Action |
|---|---|
| `<leader>p` (visual) | Paste over selection without clobbering the yank register |
| `<leader>x` | Delete without yanking (black hole) |

---

## Files — oil.nvim

Your filesystem as an editable buffer. Edit the listing like text, then `:w` to apply.

| Key | Action |
|---|---|
| `-` | Open parent directory of current file (works from inside oil to go up) |
| `<leader>e` | Same — open oil |
| `<CR>` | Open file / enter directory |
| `<C-v>` / `<C-s>` / `<C-t>` | Open in vsplit / split / tab |
| `<C-p>` | Preview |
| `<C-c>` | Close oil |
| `<C-r>` | Refresh |
| `_` | Open current working directory |
| `` ` `` / `~` | `:cd` / `:tcd` to this directory |
| `g.` | Toggle hidden files (shown by default) |
| `gs` | Change sort |
| `gx` | Open with system default app |
| `g?` | Help (all oil keys) |

Workflow: **rename** = edit the name and `:w` · **delete** = `dd` the line and `:w` ·
**create** = `o`, type `name` (or `dir/` with trailing slash) and `:w` ·
**move** = cut line in one oil buffer, paste in another, `:w` ·
**copy** = `yy` then `p` in the target directory, `:w`.

## Search — fzf-lua

| Key | Action |
|---|---|
| `<leader>ff` | Find files (respects .gitignore) |
| `<leader>fg` | Live grep (ripgrep) |
| `<leader>fw` | Grep word under cursor |
| `<leader>fb` | Open buffers |
| `<leader>fr` | Recent files |
| `<leader>fh` | Help tags |
| `<leader>fk` | Keymaps (searchable list of every mapping) |
| `<leader>fd` | Diagnostics in this buffer |
| `<leader>fs` | LSP document symbols (outline) |
| `<leader>fc` | Files in `~/.config/nvim` |
| `<leader>f/` | Resume last picker |

Inside a picker: type to filter · `<C-j>`/`<C-k>` or `<Down>`/`<Up>` move · `<CR>` open ·
`<C-v>` vsplit · `<C-s>` split · `<C-t>` tab · `<Tab>` multi-select · `<C-q>` send all results to
quickfix · `<Esc>` close.
`vim.ui.select` (e.g. code actions) also opens in fzf.

---

## Completion — blink.cmp (insert mode)

Menu opens automatically as you type; nothing is selected until you pick.

| Key | Action |
|---|---|
| `<C-n>` / `<C-p>` (or `<Down>`/`<Up>`) | Next / previous item |
| `<C-y>` | Accept |
| `<C-e>` | Dismiss menu |
| `<C-Space>` | Open menu manually / toggle documentation |
| `<C-b>` / `<C-f>` | Scroll documentation |
| `<Tab>` / `<S-Tab>` | Jump forward/back through snippet placeholders |
| `<C-k>` | Toggle signature help |

Sources: LSP (schema keys for YAML/JSON, Lua API, Python…), file paths, snippets, buffer words.

## LSP (only when a server is attached)

Neovim 0.12 built-ins:

| Key | Action |
|---|---|
| `K` | Hover docs (press again to enter the float) |
| `grn` | Rename symbol |
| `gra` | Code action (normal + visual) |
| `grr` | References (quickfix) |
| `gri` | Go to implementation |
| `grt` | Go to type definition |
| `gO` | Document symbols |
| `<C-s>` (insert) | Signature help |
| `[d` / `]d` | Previous / next diagnostic |
| `<C-w>d` | Show diagnostic under cursor in a float |
| `gcc` / `gc{motion}` | Toggle comment (line / motion; visual `gc`) |

Added shortcuts:

| Key | Action |
|---|---|
| `gd` / `gD` | Go to definition / declaration |
| `<leader>rn` | Rename |
| `<leader>ca` | Code action (also visual) — e.g. ruff auto-fixes |
| `<leader>lr` | References |
| `<leader>le` | Diagnostic under cursor (float) |
| `<leader>ld` | All buffer diagnostics → location list |
| `<leader>li` | LSP status (`:checkhealth vim.lsp`) |

Servers by filetype: lua→lua_ls · json/jsonc→jsonls · yaml→yamlls · toml→taplo ·
python→basedpyright + ruff · sh/bash/zsh→bashls (shellcheck) · css/scss/less→cssls.
JSON/YAML get schema-driven completion + validation via SchemaStore (docker-compose,
GitHub Actions, package.json, pyproject, etc. — matched by filename).

## Formatting — conform.nvim

**Never automatic.** Format on demand:

| Key | Action |
|---|---|
| `<leader>lf` | Format buffer (or visual selection) |
| `gq{motion}` | Format a range via conform |

Formatters: stylua (lua) · prettier (json, yaml, css, markdown) · taplo (toml) ·
ruff (python: organize imports + format) · shfmt (sh/bash). Falls back to the LSP if none listed.
`:ConformInfo` shows what applies to the current buffer.

---

## Git

Two tools, one `<leader>g` group: **gitsigns** works on hunks inside the file you're editing;
**neogit** is the Magit-style status/commit/push UI. Both do nothing outside a repo.

### gitsigns — hunks in the current buffer

| Key | Action |
|---|---|
| `]c` / `[c` | Next / previous hunk |
| `<leader>gs` | Stage hunk (visual: stage selection) |
| `<leader>gr` | Reset hunk (visual: reset selection) |
| `<leader>gS` / `<leader>gR` | Stage / reset whole buffer |
| `<leader>gp` | Preview hunk inline |
| `<leader>gb` | Blame current line (full) |
| `<leader>gt` | Toggle inline blame for the current line |
| `<leader>gd` | Diff buffer against index |
| `ih` (operator/visual) | Select hunk text object, e.g. `vih`, `dih` |

### neogit — status, commit, push, log

| Key | Action |
|---|---|
| `<leader>gg` | Open Neogit status (own tab) |
| `<leader>gc` | Open straight into the commit popup |
| `<leader>gl` | Log popup |
| `<leader>gP` | Push popup |

Inside the status buffer (the hint line at the top reminds you):

| Key | Action |
|---|---|
| `<Tab>` / `za` | Expand/collapse a file or section (shows the diff) |
| `s` / `u` | Stage / unstage file or hunk under cursor (works on a visual selection too) |
| `S` / `U` | Stage all / unstage all |
| `x` | Discard change under cursor (asks first) |
| `<CR>` | Open the file at that line |
| `c` → `c` | Commit popup → commit; write the message, then `:wq` (or `<C-c><C-c>`) to commit, `:q!` to abort |
| `c` → `a` | Amend |
| `p` / `P` / `f` | Pull / push / fetch popups |
| `b` | Branch popup (`b b` checkout via fzf, `b c` create) |
| `l` | Log popup (`l l` current branch); in the log, `<CR>`/`<Tab>` expand a commit |
| `d` | Diff popup |
| `Z` | Stash popup |
| `r` / `m` | Rebase / merge popups |
| `$` | Show git command history/output |
| `<C-r>` | Refresh |
| `?` | Help — every key in the current buffer |
| `q` | Close |

Popups are two-key sequences (magit style): first key opens the popup with switches listed,
second key runs the action, e.g. `cc` commit, `Pu` push to upstream, `pu` pull from upstream. Branch/commit
choosers use fzf-lua.

Typical flow: `<leader>gg` → `<Tab>` on a file to inspect → `s` to stage (or `S` for all) →
`cc` → write message → `:wq` → `Pp` (or `Pu`) to push → `q`.

## Undo — undotree

| Key | Action |
|---|---|
| `<leader>u` | Toggle the undo tree (focus moves into it) |
| `j` / `k` | Move through history (buffer previews live) |
| `<CR>` | Jump to that state |
| `?` | Help |
| `q` | Close |

Undo history persists across sessions (`undofile`), so this works on files you edited days ago.

## Treesitter

Highlighting is on for every filetype with a parser (`:InspectTree` shows the tree, `:Inspect`
shows highlight groups under the cursor). Folds are treesitter-based: `za` toggle · `zc`/`zo`
close/open · `zM` fold all · `zR` unfold all (files start fully unfolded).

`:TSInstall <lang>` add a parser · `:TSUpdate` update all ·
`:lua =require('nvim-treesitter').get_available()` list what exists.

## Indentation

guess-indent reads each file and sets `shiftwidth`/`expandtab` to match it (2-space YAML,
tab-indented conf files, 4-space Python…). New/empty files default to 2 spaces.
`:GuessIndent` re-detects. `>>` / `<<` indent / dedent a line, `=` re-indents a motion.

## Markdown

render-markdown prettifies headings/lists/tables in normal mode; raw text shows in insert mode.
`:RenderMarkdown toggle` turns it off/on.

---

## Plugin management (vim.pack, built in)

| Command | Action |
|---|---|
| `:lua vim.pack.update()` | Fetch updates for all plugins → review buffer; `:w` to apply, `:q` to discard |
| `:lua vim.pack.update(nil, {force=true})` | Apply all updates without the review buffer |
| `:lua =vim.pack.get()` | List installed plugins and revisions |
| `:lua vim.pack.del({"name"})` | Remove a plugin (remove it from `lua/plugins/init.lua` first) |
| `:restart` | Restart Neovim (reload the whole config) |
| `:checkhealth` | Full health report; `:checkhealth vim.lsp blink.cmp conform` for specific ones |

Plugin specs: `lua/plugins/init.lua`. Lockfile: `nvim-pack-lock.json` (don't hand-edit).
blink.cmp is pinned to `1.*`; nvim-treesitter tracks `main`.

## Where things live

```
init.lua                    entry point; vim.lsp.enable(...) list
lua/config/options.lua      options, colorscheme
lua/config/keymaps.lua      non-plugin keymaps
lua/config/autocmds.lua     yank highlight, treesitter start, formatoptions
lua/config/lsp.lua          diagnostics look, LspAttach keymaps
lua/plugins/<name>.lua      one file per plugin: setup + its keymaps
lsp/<server>.lua            per-server LSP config (cmd, filetypes, settings)
```

To add a language: install the server with `pacman`, drop a `lsp/<name>.lua`, add the name to
`vim.lsp.enable` in `init.lua`, add a formatter to `lua/plugins/conform.lua`, and add the parser
to `lua/plugins/treesitter.lua`.
