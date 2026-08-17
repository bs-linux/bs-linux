local aug = vim.api.nvim_create_augroup("user_autocmds", { clear = true })

-- Don't auto-continue comments on o/O (o) or <Enter> (r).
-- Must be per-buffer on FileType: ftplugins overwrite a top-level assignment.
vim.api.nvim_create_autocmd("FileType", {
  group = aug,
  callback = function()
    vim.opt_local.formatoptions:remove({ "o", "r" })
  end,
})

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = aug,
  callback = function()
    vim.hl.on_yank({ timeout = 150 })
  end,
})

-- Treesitter highlighting for every buffer that has a parser (bundled or installed
-- by nvim-treesitter). Neovim only auto-starts it for lua/markdown/help/query.
vim.api.nvim_create_autocmd("FileType", {
  group = aug,
  callback = function(ev)
    pcall(vim.treesitter.start, ev.buf)
  end,
})
