-- Basic editor settings

-- Set the leader key to Spacebar
vim.g.mapleader = ' '         -- Set the global leader key to space
vim.g.maplocalleader = ' '    -- Set the local leader key to space (useful for specific mappings within a filetype)

-- Configure backspace behavior
vim.opt.backspace = '2'       -- Allow backspacing over everything in insert mode, including indentation and start of the line

-- Display commands in the lower right corner
vim.opt.showcmd = true        -- Show incomplete commands in the command line at the bottom

-- Always show the status line at the bottom of the window
vim.opt.laststatus = 2        -- Keep the status line visible all the time

-- Automatically save before commands like :next and :make
vim.opt.autowrite = true      -- Save files automatically when using commands like :next or :make

-- Highlight the current line the cursor is on
vim.opt.cursorline = true     -- Makes the line where the cursor is placed highlighted

-- Automatically reload a file if it changes outside of Neovim
vim.opt.autoread = true       -- Automatically reload files when changed externally

-- Set tab width to 2 spaces
vim.o.tabstop = 2             -- Defines the number of spaces a tab character represents
vim.o.shiftwidth = 2          -- Specifies the number of spaces for each indentation level
vim.o.expandtab = true        -- Converts tabs to spaces (if set to true)
vim.opt.shiftround = true     -- Ensures that the indentation is rounded to the nearest 'shiftwidth'

-- Key mappings

-- Swap lines with Alt + Up or Alt + Down
vim.keymap.set('n', '<A-Up>', ':m .-2<CR>==')
vim.keymap.set('n', '<A-Down>', ':m .+1<CR>==')


-- Bind the <leader>h key to clear search highlights
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>') -- Press <leader>h to clear search highlights
