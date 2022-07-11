--vim.cmd([[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--  augroup end
--]])
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end
vim.cmd [[packadd packer.nvim]]
-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({ "nathom/filetype.nvim", config = get_setup("filetype") })

    -- Themes
    -- use({ "EdenEast/nightfox.nvim", config = get_setup("colors") })
    use({ "gruvbox-community/gruvbox", config = get_setup("colors") })
    use({
      "catppuccin/nvim",
      as = "catppuccin",
      config = get_setup("colors")
    })
    --    use({ "rebelot/kanagawa.nvim", config = get_setup("colors") })
    -- use({ 'folke/tokyonight.nvim', config = get_setup("colors") })
    -- use({ 'bluz71/vim-nightfly-guicolors', config = get_setup("colors") })

    use({
      "norcalli/nvim-colorizer.lua",
      event = "BufReadPre",
      config = get_setup("colorizer"),
    })

    -- Status line
    use({ "kyazdani42/nvim-web-devicons" })
    use({
      "nvim-lualine/lualine.nvim",
      config = get_setup("lualine"),
      event = "VimEnter",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      config = get_setup("treesitter"),
      run = ":TSUpdate",
    })
    use("nvim-treesitter/nvim-treesitter-textobjects")


    -- Autocompletion
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        {
          "tzachar/cmp-tabnine",
          run = "./install.sh",
        },
        { "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
      },
      config = get_setup("cmp"),
    })

    -- Snippets, Language, Syntax
    use({ "L3MON4D3/LuaSnip" })
    use({ "saadparwaiz1/cmp_luasnip" })
    use({
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = get_setup("autopairs"),
    })
    use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })
    use({ "mattn/emmet-vim" })
    use({ 'darrikonn/vim-gofmt' })

    -- File Explorer Tree
    use({ "kyazdani42/nvim-tree.lua", config = get_setup("tree") })

    -- Git
    use({
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      event = "BufReadPre",
      config = get_setup("gitsigns"),
    })
    use({ "tpope/vim-fugitive" })
    use({ "junegunn/gv.vim" })
    use({ "neovim/nvim-lspconfig", config = get_setup("lsp") })
    use { 'williamboman/nvim-lsp-installer' }
    use({ "nvim-lua/lsp_extensions.nvim" })
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim', config = get_setup("neogit") }

    -- Telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzy-native.nvim" },
      },
      config = get_setup("telescope"),
    })
    use({ "nvim-telescope/telescope-file-browser.nvim" })

    -- General
    use({
      "numToStr/Comment.nvim",
      opt = true,
      keys = { "gc", "gcc" },
      config = get_setup("comment"),
    })
    use({ "tpope/vim-repeat" })
    use({ "tpope/vim-surround" })
    use({ "glepnir/lspsaga.nvim" })
    use({
      "simrat39/symbols-outline.nvim",
      cmd = { "SymbolsOutline" },
      setup = get_setup("outline"),
    })
    --Formatter
    use({ "prettier/vim-prettier", run = "yarn install" })
    -- use({ "jose-elias-alvarez/null-ls.nvim", config = get_setup("null-ls") })

    if packer_bootstrap then
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
  },
})
