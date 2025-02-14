-- Setup lualine, a status line plugin for Neovim
require('lualine').setup{
  -- Configuration options for lualine
  options = {
    -- Enable icons in the status line
    icons_enabled = true,
    -- Set the theme for the status line to 'gruvbox'
    theme = 'gruvbox',
  },
  -- Define sections of the status line
  sections = {
    -- 'a' is one of the sections, typically on the left of the status line
    lualine_a = {
      -- Display the filename in the status line
      {
        'filename',
        -- Show the relative path of the file
        path = 1,
      }
    }
  }
}
