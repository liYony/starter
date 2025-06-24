local M = {}

M.nvim_tree = {
  filters = {
    dotfiles = false,
    git_ignored = false,
    custom = { "\\.cache" },
  },
}

return M

