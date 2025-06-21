require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

--- Common
map("i", "jj", "<Esc>")
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "gb", "<C-o>", { desc = "jump jump back" })

--- <Leader>
map({ "n", "i", "v" }, "<leader>q", "<cmd> q! <cr>")

--- Editing
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>", { desc = "file save" })
map({ "n", "i", "v" }, "<C-z>", "<cmd> undo <cr>", { desc = "history undo" })
map({ "n", "i", "v" }, "<C-y>", "<cmd> redo <cr>", { desc = "history redo" })

--- Comments
map("n", "<C-_>", "gcc", { desc = "comment toggle", remap = true })
map("i", "<C-_>", "<Esc>gcc^i", { desc = "comment toggle", remap = true })
map("v", "<C-_>", "gc", { desc = "comment toggle", remap = true })

--- Search
map({ "n", "i", "v" }, "<C-f>", function()
  if vim.bo.filetype == "TelescopePrompt" then
    vim.cmd "q!"
  else
    vim.cmd "Telescope current_buffer_fuzzy_find"
  end
end, { desc = "search search in current buffer" })
map({ "n", "i", "v" }, "<A-f>", function()
  if vim.bo.filetype == "TelescopePrompt" then
    vim.cmd "q!"
  else
    vim.cmd "Telescope live_grep"
  end
end, { desc = "search search across project" })
map({ "n", "i", "v" }, "<C-p>", function()
  if vim.bo.filetype == "TelescopePrompt" then
    vim.cmd "q!"
  else
    vim.cmd "Telescope find_files"
  end
end, { desc = "search search across project" })

--- Terminal
map({ "n", "i", "v", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggle vertical term" })
map({ "n", "i", "v", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggle horizontal term" })
map({ "n", "i", "v", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, desc = "terminal toggle quit" })
map("t", "<A-q>", "<C-\\><C-n>:q!<CR>", { noremap = true, desc = "terminal toggle close" })

--- CopilotChat
map({ 'n', 'v' }, '<leader>cc', ':CopilotChatToggle<CR>')
map({ 'n', 'v' }, '<leader>ce', ':CopilotChatExplain<CR>')
map({ 'n', 'v' }, '<leader>ct', ':CopilotChatTests<CR>')
map({ 'n', 'v' }, '<leader>cr', ':CopilotChatReview<CR>')
map({ 'n', 'v' }, '<leader>cf', ':CopilotChatFix<CR>')
map({ 'n', 'v' }, '<leader>cm', ':CopilotChatCommit<CR>')

-- Session Management
map("n", "<leader>ss", "<cmd>SessionManager load_session<cr>", { desc = "Load session" })
map("n", "<leader>sd", "<cmd>SessionManager delete_session<cr>", { desc = "Delete session" })
