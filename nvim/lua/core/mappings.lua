local M = {}

M.general = {
  i = {
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
  },

  n = {
    ["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },

    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "Window/Pane left" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "Window/Pane right" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "Window/Pane down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "Window/Pane up" },

    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
    ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },
  },

  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },

    ["<C-h>"] = {
      function()
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<C-\\><C-N>:TmuxNavigateLeft<CR>", true, false, true),
          "n",
          true
        )
      end,
      "Terminal: Pane left",
    },
    ["<C-l>"] = {
      function()
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<C-\\><C-N>:TmuxNavigateRight<CR>", true, false, true),
          "n",
          true
        )
      end,
      "Terminal: Pane right",
    },
    ["<C-j>"] = {
      function()
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<C-\\><C-N>:TmuxNavigateDown<CR>", true, false, true),
          "n",
          true
        )
      end,
      "Terminal: Pane down",
    },
    ["<C-k>"] = {
      function()
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<C-\\><C-N>:TmuxNavigateUp<CR>", true, false, true),
          "n",
          true
        )
      end,
      "Terminal: Pane up",
    },
  },
}

-- Keep selection when indenting in visual mode
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })
vim.keymap.set("v", "<", "<gv", { desc = "Outdent and keep selection" })

-- add empty tables for the other sections NVChad expects
M.nvimtree = {}
M.telescope = {}
M.comment = {}
M.lspconfig = {}
M.gitsigns = {}
M.tabufline = {}
M.nvterm = {}
M.whichkey = {}
M.blankline = {}

return M

