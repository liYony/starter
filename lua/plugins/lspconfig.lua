return {
  {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
  },

  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    event = "VimEnter",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
    },
    opts = function()
      require "configs.lspconfig"
      return {
        ensure_installed = {
          -- Customize the required LSP service here
          "lua_ls",
          "html",
          "cssls",
          "clangd",
          "cmake",
        },
      }
    end,
  },
}
