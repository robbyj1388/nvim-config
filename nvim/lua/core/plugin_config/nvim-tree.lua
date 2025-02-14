-- Disable netrw (file explorer) to avoid conflicts with NvimTree
vim.g.loaded_netrw = 1            -- Disable netrw (the default file explorer plugin)
vim.g.loaded_netrwPlugin = 1      -- Disable the netrw plugin

-- Setup NvimTree (a file explorer plugin for Neovim)
require("nvim-tree").setup()


-- Open NvimTree automatically when Neovim starts
vim.cmd([[autocmd VimEnter * NvimTreeOpen]])


-- Key mapping to toggle NvimTree file explorer
-- <c-b> (Ctrl + b) will toggle the NvimTree file explorer and focus on the current file
vim.keymap.set('n', '<c-b>', ':NvimTreeFindFileToggle<CR>') 

