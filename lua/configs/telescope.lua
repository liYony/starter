local M = {}

function M.setup()
  require('telescope').setup {
    extensions = {
      ["ui-select"] = {
        require('telescope.themes').get_dropdown {
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
        }
      }
    }
  }
  require("telescope").load_extension("ui-select")
end

return M
