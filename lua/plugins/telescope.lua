return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  opts = require "configs.telescope",
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension "ui-select"
  end,
}
