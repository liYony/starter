return {
  'smoka7/hop.nvim',
  version = "*",
  opts = {
    keys = 'etovxqpdygfblzhckisuran'
  },
  keys = {
    -- go to any word in the current buffer (:hopword).
    { "<leader><leader>w", "<cmd>HopWord<CR>",      desc = "Hop: Jump to any word" },
    -- go to any character in the current buffer (:hopchar1).
    { "<leader><leader>c", "<cmd>HopChar1<CR>",     desc = "Hop: Jump to any character" },
    -- go to any bigrams in the current buffer (:hopchar2).
    { "<leader><leader>C", "<cmd>HopChar2<CR>",     desc = "Hop: Jump to any bigram" },
    -- make an arbitrary search akin to / and go to any occurrences (:hoppattern).
    { "<leader><leader>p", "<cmd>HopPattern<CR>",   desc = "Hop: Jump to custom pattern" },
    -- go to any line and any line start (:hopline, :hoplinestart).
    { "<leader><leader>l", "<cmd>HopLine<CR>",      desc = "Hop: Jump to any line position" },
    { "<leader><leader>L", "<cmd>HopLineStart<CR>", desc = "Hop: Jump to line start" },
    -- go to anywhere (:hopanywhere).
    { "<leader><leader>a", "<cmd>HopAnywhere<CR>",  desc = "Hop: Jump to any position" },
    -- yank the text between two hinted position without jumping (:hopyankchar1).
    { "<leader><leader>y", "<cmd>HopYankChar1<CR>", desc = "Hop: Yank text between positions" },
  }
}
