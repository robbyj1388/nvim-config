
-- Import the built-in Telescope functions
local builtin = require('telescope.builtin')

-- Map <C-p> to open file search using Telescope
vim.keymap.set('n', '<c-p>', builtin.find_files, {})  -- Press Ctrl + P to find files

-- Map <Space><Space> to open recently opened files list
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})  -- Press Space twice to view old files

-- Map <Space>fg to search files using live grep
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})  -- Press Space + fg to search for text in files

-- Map <Space>fh to search through help tags
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})  -- Press Space + fh to search Neovim's help tags

