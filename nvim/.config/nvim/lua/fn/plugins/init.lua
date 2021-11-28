local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

return require "packer".startup(
  function(use)
        use {"nvim-lua/popup.nvim"}
    use {"nvim-lua/plenary.nvim"}
    use {"wbthomason/packer.nvim"}

    use {"tpope/vim-repeat"}
    use {"tpope/vim-unimpaired"}
    use {"christoomey/vim-tmux-navigator"}
    use {"tpope/vim-surround"}
    use {"tmux-plugins/vim-tmux"}
    use {
      "terrortylor/nvim-comment",
      config = function()
        require("nvim_comment").setup(
          {
            hook = function()
              require('ts_context_commentstring.internal').update_commentstring()
            end
          }
        )
      end
    }
    use {"JoosepAlviste/nvim-ts-context-commentstring"}
    use {"kyazdani42/nvim-web-devicons"}
    
    -- Statusline
    use {"hoob3rt/lualine.nvim"}
    
    -- HTML
    use {"mattn/emmet-vim"}
    use {"posva/vim-vue"}
    use {"othree/html5.vim"}
    
    -- CSS
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require "colorizer".setup()
      end
    }

    -- Colors
    use {"mhartington/oceanic-next"}
    use 'gruvbox-community/gruvbox'
    
    -- Editor Config
    use {"editorconfig/editorconfig-vim"}
    
    -- Git
    use {"tpope/vim-fugitive"}
    use {"tpope/vim-rhubarb"}
    use {"sgeb/vim-diff-fold"}
    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require "gitsigns".setup {
          debug_mode = false,
          signs = {
            add = {hl = "GitGutterAdd", text = "│"},
            change = {hl = "GitGutterChange", text = "│"},
            delete = {hl = "GitGutterDelete", text = "_"},
            topdelete = {hl = "GitGutterDelete", text = "‾"},
            changedelete = {hl = "GitGutterChangeDelete", text = "~"}
          }
        }
      end
    }
    use {"pwntester/octo.nvim"}
    
    -- JS/TS
    use {"elzr/vim-json"}
    
    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter'}
    use {"nvim-treesitter/playground"}

    -- Language Servers
    use {'neovim/nvim-lspconfig'}
    
    -- Completion
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'ray-x/cmp-treesitter',
        {
          'tzachar/cmp-tabnine',
          run = "./install.sh",
        },
        'onsails/lspkind-nvim'
      }
    }
    
    -- Markdown
    use {"tpope/vim-markdown", ft = "markdown"}

    -- Telescope
    use {"nvim-telescope/telescope.nvim"}
    use {"nvim-telescope/telescope-github.nvim"}
    use {"nvim-telescope/telescope-packer.nvim"}
    use {"nvim-telescope/telescope-node-modules.nvim"}
    use {"nvim-telescope/telescope-fzy-native.nvim"}

    use {"preservim/NERDTree"}

    --Formatter
    use {"mhartington/formatter.nvim"}

  end
)
