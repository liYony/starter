local Path = require('plenary.path')
local config = require('session_manager.config')

local options = {
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),                         -- The directory where the session files will be saved.
  autoload_mode = { config.AutoloadMode.CurrentDir, config.AutoloadMode.LastSession }, -- Define what to do when Neovim is started without arguments. See "Autoload mode" section below.
  autosave_last_session = true,                                                        -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true,                                                   -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_dirs = {},                                                           -- A list of directories where the session will not be autosaved.
  autosave_ignore_filetypes = {                                                        -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
    'gitrebase',
  },
  autosave_ignore_buftypes = {},    -- All buffers of these bufer types will be closed before the session is saved.
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  max_path_length = 80,             -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
  load_include_current = false,     -- The currently loaded session appears in the load_session UI.
}

local cfg_group = vim.api.nvim_create_augroup('SessionManagerGroup', {})

vim.api.nvim_create_autocmd('User', {
  pattern = "SessionLoadPost",
  group = cfg_group,
  callback = function()
    require('nvim-tree.api').tree.toggle(false, true)
  end,
})

-- vim.api.nvim_create_autocmd('BufWritePre', {
--   group = cfg_group,
--   callback = function()
--     -- Don't save while there's any 'nofile' buffer open.
--     for _, buf in ipairs(vim.api.nvim_list_bufs()) do
--       if vim.api.nvim_get_option_value('buftype', { buf = buf }) == 'nofile' then
--         return
--       end
--     end
--     require('session_manager').save_current_session()
--   end
-- })

return options
