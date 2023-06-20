vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'yamatsum/nvim-cursorline'
  use 'nvim-tree/nvim-web-devicons'
  use 'dense-analysis/ale'
end)
