local actions = require "telescope.actions"

-- [BUG] Temporary fix <https://github.com/nvim-treesitter/nvim-treesitter/issues/7952>
local open_after_tree = function(prompt_bufnr)
  vim.defer_fn(function()
    actions.select_default(prompt_bufnr)
  end, 100) -- Delay allows filetype and plugins to settle before opening
end

return {
  defaults = {
    mappings = {
      i = { ["<CR>"] = open_after_tree }, -- [BUG] Temporary fix
      n = { ["<CR>"] = open_after_tree }, -- [BUG] Temporary fix
    },
    prompt_prefix = "🔍 ",
    selection_caret = " ",
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        layout_config = {
          width = 0.4,
          height = 0.6,
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        prompt_prefix = "🔍 ",
        selection_caret = " ",
        border = true,
        winblend = 15,
        color_devicons = true,
        hl_result_eol = false,
        use_less = true,
      },
    },
  },
}

