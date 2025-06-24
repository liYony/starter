return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.interface").nvim_tree,
  },

  {
    "nvim-treesitter/nvim-treesitter",
  },

  -- Sticky scroll
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    opts = {},
  },

  -- Breadcrumbs
  {
    "Bekaboo/dropbar.nvim",
    lazy = false,
    -- Optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    opts = {},
  },

  -- Rainbow pair colorization
  {
    "hiphish/rainbow-delimiters.nvim",
    lazy = false,
  },

  -- Set consistent terminal background color with theme
  {
    "typicode/bg.nvim",
    lazy = false,
  },
}
