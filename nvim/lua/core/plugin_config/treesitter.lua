-- Ensure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
  end
end

ensure_packer()

-- Use packer to manage plugins
return require('packer').startup(function(use)
  use {'nvim-treesitter/nvim-treesitter', config = function()
    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,  -- Enable syntax highlighting
      },
    }
  end}
end)

