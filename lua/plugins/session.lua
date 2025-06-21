return {
  'Shatur/neovim-session-manager',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-ui-select.nvim'
  },
  lazy = false, -- load on startup
  opts = function()
    return require 'configs.session'
  end,
}
