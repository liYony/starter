require "nvchad.options"

-- add yours here!

vim.o.cursorlineopt = 'both' -- to enable cursorline!

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Enable Neovim's local configuration file feature(.nvim.lua, .nvimrc, .exrc)
vim.opt.exrc = true
vim.opt.secure = true

--- Enable OSC 52 for copying to system clipboard in SSH
-- See: https://github.com/neovim/neovim/issues/28611#issuecomment-2147744670
if os.getenv "SSH_TTY" then
  vim.g.clipboard = {
    name = "OSC 52",
    -- Try to use OSC 52 escape sequences to copy to system clipboard
    -- It should not break anything if it’s not supported
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy "+",
      ["*"] = require("vim.ui.clipboard.osc52").copy "*",
    },
    -- Disable paste since it does not work in some terminals,
    -- i.e., xterm.js (many app based on Web tech use this)
    paste = {
      ["+"] = function(lines)
        return vim.split(vim.fn.getreg '"', "\n")
      end,
      ["*"] = function(lines)
        return vim.split(vim.fn.getreg '"', "\n")
      end,
    },
  }
end

--- Automatically set indentation
local function setup_indent()
  local ft = vim.bo.filetype
  if ft == "lua" then
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  else
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = setup_indent
})

--- Automatically enter NvimTree
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function(args)
    if args.file ~= "" and vim.fn.isdirectory(args.file) == 1 then
      local target_dir = vim.fn.fnamemodify(args.file, ":p")  -- get absolute path
      vim.cmd.cd(target_dir)
      local open_nvimtree = function()
        pcall(function()
          if pcall(require, "nvim-tree.api") then
            require("nvim-tree.api").tree.open()
          else
            vim.cmd("NvimTreeOpen")
          end
          vim.cmd("wincmd p")
        end)
      end
      if vim.v.vim_did_enter == 1 then  -- neovim has finished loading
        open_nvimtree()
      else
        vim.defer_fn(open_nvimtree, 100)
      end
    end
  end
})
