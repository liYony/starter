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
    config = function()
      require("configs.interface").rainbow_delimiters()
    end,
  },

  -- Set consistent terminal background color with theme
  {
    "typicode/bg.nvim",
    lazy = false,
  },

  {
    "sphamba/smear-cursor.nvim",
    lazy = false,

    opts = {
      -- Smooth cursor without smear
      stiffness = 0.5,
      trailing_stiffness = 0.5,
      matrix_pixel_threshold = 0.5,
      -- Smear cursor when switching buffers or windows.
      smear_between_buffers = true,

      -- Smear cursor when moving within line or to neighbor lines.
      -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
      smear_between_neighbor_lines = true,

      -- Draw the smear in buffer space instead of screen space when scrolling
      scroll_buffer_space = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears will blend better on all backgrounds.
      legacy_computing_symbols_support = false,

      -- Smear cursor in insert mode.
      -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
      smear_insert_mode = true,
    },
  },
}
