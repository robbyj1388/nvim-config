local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- My plugins

  -- Packer itself, the plugin manager
  use 'wbthomason/packer.nvim'

  -- Gruvbox color scheme plugin for a pleasant and popular theme
  use 'ellisonleao/gruvbox.nvim'   -- Color Scheme
  use 'bluz71/vim-nightfly-colors' -- Color Scheme

  -- Nvim-tree for file system explorer, allows you to browse files and directories
  use 'nvim-tree/nvim-tree.lua'     -- File system tree

  -- Nvim-web-devicons provides cool icons for files in the NvimTree plugin
  use 'nvim-tree/nvim-web-devicons' -- Cool icons for file tree

  -- Lualine plugin for a fancy status line at the bottom of your Neovim window
  use 'nvim-lualine/lualine.nvim'

  -- Treesitter for better syntax highlighting and code understanding
  use 'nvim-treesitter/nvim-treesitter'

  -- Auto Completion (IDE like)
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Snippet for auto Completion
  use 'L3MON4D3/LuaSnip'
  
  use 'saadparwaiz1/cmp_luasnip'
  use "rafamadriz/friendly-snippets"

  -- LSP Server plugin
  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }


  -- Telescope for fuzzy file searching, text searching, and other tasks
  -- It depends on the plenary.nvim plugin to function correctly
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',  -- Use latest commit
    requires = { {'nvim-lua/plenary.nvim'} }  -- Required dependency for Telescope
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- If packer is being installed for the first time, sync it
  if packer_bootstrap then
    require('packer').sync()  -- Sync plugins and their configurations
  end
end)

