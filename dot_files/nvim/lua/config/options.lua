-- ====================================================================================
-- Colors
-- ====================================================================================
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme("catppuccin") -- bundled with Neovim 0.12

-- ====================================================================================
-- Leader
-- ====================================================================================
vim.g.mapleader = " " -- sets space bar as the leader key
vim.g.maplocalleader = " "

-- ====================================================================================
-- General Settings
-- ====================================================================================
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.colorcolumn = "100" -- vertical ruler; "" to turn off
vim.opt.signcolumn = "yes" -- always reserve the sign gutter
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.mouse = "a" -- enable mouse support

-- ====================================================================================
-- Scrolling & Splits
-- ====================================================================================
vim.opt.scrolloff = 10 -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 10 -- keep 10 lines to the left/right of cursor
vim.opt.splitbelow = true -- horizontal splits open below
vim.opt.splitright = true -- vertical splits open to the right
vim.opt.splitkeep = "screen" -- don't visually shift content when splitting

-- ====================================================================================
-- Tabs and Indents (guess-indent.nvim overrides these per buffer)
-- ====================================================================================
vim.opt.tabstop = 2 -- tab width
vim.opt.shiftwidth = 2 -- indent width
vim.opt.expandtab = true -- spaces, not tabs, by default
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from current line

-- ====================================================================================
-- Search Options
-- ====================================================================================
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type
vim.opt.iskeyword:append("-") -- include - in words
vim.opt.path:append("**") -- include sub directories in search
vim.opt.selection = "inclusive" -- include last char in selection

-- ====================================================================================
-- Clipboard & Saving
-- ====================================================================================
vim.opt.clipboard = "unnamedplus" -- enable access to system clipboard
vim.opt.swapfile = false -- reduces clutter
vim.opt.undofile = true -- persist undo history across sessions
vim.opt.autowrite = false -- do not autosave

-- ====================================================================================
-- Completion
-- ====================================================================================
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c") -- silence "match 1 of 3" messages
vim.opt.wildmenu = true -- tab completion

-- ====================================================================================
-- Performance
-- ====================================================================================
vim.opt.updatetime = 250 -- faster autocmd triggers
vim.opt.timeoutlen = 500 -- timeout duration
vim.opt.ttimeoutlen = 10 -- remove key sequence delays
vim.opt.redrawtime = 1500 -- ms budget for syntax/search highlighting
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no annoying error sounds

-- ====================================================================================
-- Folding (treesitter-based)
-- ====================================================================================
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "" -- keep syntax highlighting on the fold line
vim.opt.foldlevelstart = 99 -- start with everything unfolded
vim.opt.foldenable = true
