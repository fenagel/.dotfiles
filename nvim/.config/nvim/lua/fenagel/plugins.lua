local vim = vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd('packadd packer.nvim')

local packer = require('packer')

return packer.startup(function(use)
    use 'gruvbox-community/gruvbox'
    
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use 'onsails/lspkind-nvim'
    use 'glepnir/lspsaga.nvim'
    use 'ryanoasis/vim-devicons'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    
    use 'darrikonn/vim-gofmt'
    use 'jiangmiao/auto-pairs'
    use 'vim-airline/vim-airline'
    
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'preservim/NERDTree'

    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'junegunn/gv.vim'
    use 'vim-utils/vim-man'
    use 'mbbill/undotree'

    -- telescope requirements...
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'

    use 'sbdchd/neoformat'

    if packer_bootstrap then
      require('packer').sync()
    end
end)
