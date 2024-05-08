return {
  'neovim/nvim-lspconfig',
  depedencies = {
    {
      'dnlhc/glance.nvim',
      cmd = 'Glance',
      ---@class GlanceOpts
      opts = {
        border = {
          enable = true,
          top_char = '―',
          bottom_char = '―',
        },
      },
    },
  },
  ---@class PluginLspOpts
  opts = {
    diagnostics = { virtual_text = true },
    servers = {
      yamlls = {
        settings = {
          yaml = { keyOrdering = false },
        },
      },
      graphql = {
        filetypes = { 'graphql', 'typescript', 'typescriptreact' },
      },
    },
  },
}
