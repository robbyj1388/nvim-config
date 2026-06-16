-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Add this to lua/config/options.lua
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- r: don't auto-insert comment leader after Enter in Insert mode
    -- o: don't auto-insert comment leader after 'o' or 'O' in Normal mode
    -- c: don't auto-wrap comments using textwidth
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  desc = "Disable New Line Comment",
})
